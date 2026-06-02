import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_providers.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list_state.dart';
import 'package:stream_transform/stream_transform.dart';

class ProviderListBloc extends Bloc<ProviderListEvent, ProviderListState> {
  ProviderListBloc({required GetProviders getProviders})
      : _getProviders = getProviders,
        super(const ProviderListState.initial()) {
    on<ProviderListStarted>(_onStarted);
    on<ProviderListSearchChanged>(
      _onSearchChanged,
      transformer: _debounce(const Duration(milliseconds: 300)),
    );
    on<ProviderListTypeSelected>(_onTypeSelected);
    on<ProviderListFilterChanged>(_onFilterChanged);
    on<ProviderListRefreshed>(_onRefreshed);
  }

  final GetProviders _getProviders;
  ProviderFilter _filter = const ProviderFilter();

  /// Filtre ekranını mevcut seçimlerle açabilmek için.
  ProviderFilter get currentFilter => _filter;

  Future<void> _onStarted(
    ProviderListStarted event,
    Emitter<ProviderListState> emit,
  ) => _load(emit);

  Future<void> _onSearchChanged(
    ProviderListSearchChanged event,
    Emitter<ProviderListState> emit,
  ) {
    _filter = _filter.copyWith(query: event.query);
    return _load(emit);
  }

  Future<void> _onTypeSelected(
    ProviderListTypeSelected event,
    Emitter<ProviderListState> emit,
  ) {
    _filter = _filter.copyWith(type: event.type);
    return _load(emit);
  }

  Future<void> _onFilterChanged(
    ProviderListFilterChanged event,
    Emitter<ProviderListState> emit,
  ) {
    // Filtre ekranı tip/arama'ya dokunmaz; ikisini de koru.
    _filter = event.filter.copyWith(query: _filter.query, type: _filter.type);
    return _load(emit);
  }

  Future<void> _onRefreshed(
    ProviderListRefreshed event,
    Emitter<ProviderListState> emit,
  ) => _load(emit);

  Future<void> _load(Emitter<ProviderListState> emit) async {
    emit(const ProviderListState.loading());
    final result = await _getProviders(_filter);
    switch (result) {
      case Success(:final data):
        emit(
          data.isEmpty
              ? const ProviderListState.empty()
              : ProviderListState.loaded(data),
        );
      case ResultFailure(:final failure):
        emit(ProviderListState.error(_messageFor(failure)));
    }
  }

  String _messageFor(Failure failure) => switch (failure) {
        NetworkFailure() => 'İnternet bağlantısı yok. Lütfen tekrar deneyin.',
        ServerFailure() => 'Bir şeyler ters gitti. Lütfen tekrar deneyin.',
        _ => 'Beklenmeyen bir hata oluştu. Lütfen tekrar deneyin.',
      };
}

EventTransformer<E> _debounce<E>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}
