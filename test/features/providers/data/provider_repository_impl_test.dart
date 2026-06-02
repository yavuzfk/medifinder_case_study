import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/core/error/exceptions.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_cache_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_remote_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/models/provider_model.dart';
import 'package:medifinder_case_study/features/providers/data/repositories/provider_repository_impl.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements ProviderRemoteDataSource {}

class _MockCache extends Mock implements ProviderCacheDataSource {}

void main() {
  setUpAll(() => registerFallbackValue(const ProviderFilter()));

  late _MockRemote remote;
  late _MockCache cache;
  late ProviderRepositoryImpl repository;

  setUp(() {
    remote = _MockRemote();
    cache = _MockCache();
    repository = ProviderRepositoryImpl(remote, cache);
    // Varsayılan: cache boş (offline fallback olmasın).
    when(() => cache.readCatalog()).thenReturn(const []);
    when(() => cache.saveCatalog(any())).thenAnswer((_) async {});
  });

  const model = ProviderModel(
    id: '1',
    name: 'Dr. Emily Carter',
    type: 'doctor',
    category: 'Cardiology',
    country: 'United States',
    city: 'New York',
  );

  group('getProviders', () {
    test('returns live data and caches the full catalog', () async {
      when(() => remote.getProviders(any())).thenAnswer((_) async => [model]);

      final result = await repository.getProviders(const ProviderFilter());

      expect(result, isA<Success<Cached<List<Provider>>>>());
      final data = (result as Success<Cached<List<Provider>>>).data;
      expect(data.fromCache, isFalse);
      expect(data.value.single.id, '1');
      expect(data.value.single.type, ProviderType.doctor);
      verify(() => cache.saveCatalog([model])).called(1);
    });

    test('falls back to cache (fromCache: true) when remote fails', () async {
      when(() => remote.getProviders(any()))
          .thenThrow(const ServerException('offline'));
      when(() => cache.readCatalog()).thenReturn(const [model]);

      final result = await repository.getProviders(const ProviderFilter());

      final data = (result as Success<Cached<List<Provider>>>).data;
      expect(data.fromCache, isTrue);
      expect(data.value.single.id, '1');
    });

    test('returns Failure.server when remote fails and cache is empty',
        () async {
      when(() => remote.getProviders(any()))
          .thenThrow(const ServerException('boom'));

      final result = await repository.getProviders(const ProviderFilter());

      expect(
        (result as ResultFailure<Cached<List<Provider>>>).failure,
        isA<ServerFailure>(),
      );
    });
  });

  group('getProviderById', () {
    test('maps NotFoundException to Failure.notFound (no cache fallback)',
        () async {
      when(() => remote.getProviderById(any()))
          .thenThrow(const NotFoundException());

      final result = await repository.getProviderById('x');

      expect(
        (result as ResultFailure<Cached<Provider>>).failure,
        isA<NotFoundFailure>(),
      );
    });

    test('falls back to cached provider when remote fails', () async {
      when(() => remote.getProviderById(any()))
          .thenThrow(const ServerException('offline'));
      when(() => cache.readCatalog()).thenReturn(const [model]);

      final result = await repository.getProviderById('1');

      final data = (result as Success<Cached<Provider>>).data;
      expect(data.fromCache, isTrue);
      expect(data.value.id, '1');
    });
  });
}
