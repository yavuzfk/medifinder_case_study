import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_filter_options.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/filter/filter_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/filter/filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc({required GetFilterOptions getFilterOptions})
      : _getFilterOptions = getFilterOptions,
        super(const FilterState.loading()) {
    on<FilterStarted>(_onStarted);
    on<FilterCountrySelected>(_onCountrySelected);
    on<FilterCitySelected>(_onCitySelected);
    on<FilterCategorySelected>(_onCategorySelected);
    on<FilterCleared>(_onCleared);
  }

  final GetFilterOptions _getFilterOptions;

  Future<void> _onStarted(
    FilterStarted event,
    Emitter<FilterState> emit,
  ) async {
    emit(const FilterState.loading());
    final result = await _getFilterOptions();
    switch (result) {
      case Success(:final data):
        emit(
          FilterState.ready(
            options: data,
            country: event.initial.country,
            city: event.initial.city,
            category: event.initial.category,
          ),
        );
      case ResultFailure(:final failure):
        emit(FilterState.error(_messageFor(failure)));
    }
  }

  void _onCountrySelected(
    FilterCountrySelected event,
    Emitter<FilterState> emit,
  ) {
    final state = this.state;
    if (state is! FilterReady) return;
    emit(state.copyWith(country: event.country, city: null));
  }

  void _onCitySelected(FilterCitySelected event, Emitter<FilterState> emit) {
    final state = this.state;
    if (state is! FilterReady) return;
    emit(state.copyWith(city: event.city));
  }

  void _onCategorySelected(
    FilterCategorySelected event,
    Emitter<FilterState> emit,
  ) {
    final state = this.state;
    if (state is! FilterReady) return;
    emit(state.copyWith(category: event.category));
  }

  void _onCleared(FilterCleared event, Emitter<FilterState> emit) {
    final state = this.state;
    if (state is! FilterReady) return;
    emit(state.copyWith(country: null, city: null, category: null));
  }

  String _messageFor(Failure failure) => switch (failure) {
        NetworkFailure() => 'İnternet bağlantısı yok. Lütfen tekrar deneyin.',
        ServerFailure() => 'Filtreler yüklenemedi. Lütfen tekrar deneyin.',
        _ => 'Beklenmeyen bir hata oluştu. Lütfen tekrar deneyin.',
      };
}
