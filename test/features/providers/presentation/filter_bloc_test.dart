import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/filter_options.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_filter_options.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/filter_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/filter_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/filter_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetFilterOptions extends Mock implements GetFilterOptions {}

void main() {
  late _MockGetFilterOptions getFilterOptions;

  setUp(() => getFilterOptions = _MockGetFilterOptions());

  FilterBloc build() => FilterBloc(getFilterOptions: getFilterOptions);

  const options = FilterOptions(
    countries: ['Germany', 'United States'],
    citiesByCountry: {
      'United States': ['New York'],
      'Germany': ['Berlin'],
    },
    categories: ['Cardiology'],
  );

  blocTest<FilterBloc, FilterState>(
    'emits [loading, ready] with pre-filled selections from initial',
    setUp: () => when(() => getFilterOptions())
        .thenAnswer((_) async => const Success(options)),
    build: build,
    act: (bloc) => bloc.add(
      const FilterEvent.started(
        ProviderFilter(country: 'United States', city: 'New York'),
      ),
    ),
    expect: () => [
      const FilterState.loading(),
      const FilterState.ready(
        options: options,
        country: 'United States',
        city: 'New York',
      ),
    ],
  );

  blocTest<FilterBloc, FilterState>(
    'emits [loading, error] when loading options fails',
    setUp: () => when(() => getFilterOptions())
        .thenAnswer((_) async => const ResultFailure(Failure.server())),
    build: build,
    act: (bloc) => bloc.add(const FilterEvent.started(ProviderFilter())),
    expect: () => [
      const FilterState.loading(),
      isA<FilterError>(),
    ],
  );

  blocTest<FilterBloc, FilterState>(
    'resets city when country changes (cascading)',
    build: build,
    seed: () => const FilterState.ready(
      options: options,
      country: 'United States',
      city: 'New York',
    ),
    act: (bloc) => bloc.add(const FilterEvent.countrySelected('Germany')),
    expect: () => [
      const FilterState.ready(
        options: options,
        country: 'Germany',
      ),
    ],
  );
}
