import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_providers.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list/provider_list_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list/provider_list_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list/provider_list_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetProviders extends Mock implements GetProviders {}

void main() {
  setUpAll(() => registerFallbackValue(const ProviderFilter()));

  late _MockGetProviders getProviders;

  setUp(() => getProviders = _MockGetProviders());

  ProviderListBloc build() => ProviderListBloc(getProviders: getProviders);

  const provider = Provider(
    id: '1',
    name: 'Dr. Emily Carter',
    type: ProviderType.doctor,
    category: 'Cardiology',
    country: 'United States',
    city: 'New York',
  );

  blocTest<ProviderListBloc, ProviderListState>(
    'emits [loading, loaded] when providers are returned',
    setUp: () => when(() => getProviders(any())).thenAnswer(
      (_) async => const Success((value: [provider], fromCache: false)),
    ),
    build: build,
    act: (bloc) => bloc.add(const ProviderListEvent.started()),
    expect: () => [
      const ProviderListState.loading(),
      const ProviderListState.loaded([provider]),
    ],
  );

  blocTest<ProviderListBloc, ProviderListState>(
    'emits [loading, empty] when result is empty',
    setUp: () => when(() => getProviders(any())).thenAnswer(
      (_) async => const Success((value: <Provider>[], fromCache: false)),
    ),
    build: build,
    act: (bloc) => bloc.add(const ProviderListEvent.started()),
    expect: () => [
      const ProviderListState.loading(),
      const ProviderListState.empty(),
    ],
  );

  blocTest<ProviderListBloc, ProviderListState>(
    'emits [loading, error] on failure',
    setUp: () => when(() => getProviders(any())).thenAnswer(
      (_) async => const ResultFailure(Failure.server()),
    ),
    build: build,
    act: (bloc) => bloc.add(const ProviderListEvent.started()),
    expect: () => [
      const ProviderListState.loading(),
      isA<ProviderListError>(),
    ],
  );

  blocTest<ProviderListBloc, ProviderListState>(
    'debounces search and queries with the typed value',
    setUp: () => when(() => getProviders(any())).thenAnswer(
      (_) async => const Success((value: [provider], fromCache: false)),
    ),
    build: build,
    act: (bloc) => bloc.add(const ProviderListEvent.searchChanged('emily')),
    wait: const Duration(milliseconds: 350),
    expect: () => [
      const ProviderListState.loading(),
      const ProviderListState.loaded([provider]),
    ],
    verify: (_) => verify(
      () => getProviders(
        any(
          that: isA<ProviderFilter>().having((f) => f.query, 'query', 'emily'),
        ),
      ),
    ).called(1),
  );
}
