import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/core/error/exceptions.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_local_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/models/provider_model.dart';
import 'package:medifinder_case_study/features/providers/data/repositories/provider_repository_impl.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocalDataSource extends Mock implements ProviderLocalDataSource {}

void main() {
  setUpAll(() => registerFallbackValue(const ProviderFilter()));

  late _MockLocalDataSource local;
  late ProviderRepositoryImpl repository;

  setUp(() {
    local = _MockLocalDataSource();
    repository = ProviderRepositoryImpl(local);
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
    test('returns Success with mapped entities', () async {
      when(() => local.getProviders(any())).thenAnswer((_) async => [model]);

      final result = await repository.getProviders(const ProviderFilter());

      expect(result, isA<Success<List<Provider>>>());
      final data = (result as Success<List<Provider>>).data;
      expect(data.single.id, '1');
      expect(data.single.type, ProviderType.doctor);
    });

    test('maps ServerException to Failure.server', () async {
      when(() => local.getProviders(any()))
          .thenThrow(const ServerException('boom'));

      final result = await repository.getProviders(const ProviderFilter());

      expect(result, isA<ResultFailure<List<Provider>>>());
      expect(
        (result as ResultFailure<List<Provider>>).failure,
        isA<ServerFailure>(),
      );
    });
  });

  group('getProviderById', () {
    test('maps NotFoundException to Failure.notFound', () async {
      when(() => local.getProviderById(any()))
          .thenThrow(const NotFoundException());

      final result = await repository.getProviderById('x');

      expect(
        (result as ResultFailure<Provider>).failure,
        isA<NotFoundFailure>(),
      );
    });
  });
}
