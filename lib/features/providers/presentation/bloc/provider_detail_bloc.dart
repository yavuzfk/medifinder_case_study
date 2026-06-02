import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_provider_detail.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail_state.dart';

class ProviderDetailBloc
    extends Bloc<ProviderDetailEvent, ProviderDetailState> {
  ProviderDetailBloc({required GetProviderDetail getProviderDetail})
      : _getProviderDetail = getProviderDetail,
        super(const ProviderDetailState.loading()) {
    on<ProviderDetailStarted>(_onStarted);
    on<ProviderDetailRetried>(_onRetried);
  }

  final GetProviderDetail _getProviderDetail;
  String _id = '';

  Future<void> _onStarted(
    ProviderDetailStarted event,
    Emitter<ProviderDetailState> emit,
  ) {
    _id = event.id;
    return _load(emit);
  }

  Future<void> _onRetried(
    ProviderDetailRetried event,
    Emitter<ProviderDetailState> emit,
  ) => _load(emit);

  Future<void> _load(Emitter<ProviderDetailState> emit) async {
    emit(const ProviderDetailState.loading());
    final result = await _getProviderDetail(_id);
    switch (result) {
      case Success(:final data):
        emit(ProviderDetailState.loaded(data));
      case ResultFailure(:final failure):
        emit(ProviderDetailState.error(_messageFor(failure)));
    }
  }

  String _messageFor(Failure failure) => switch (failure) {
        NotFoundFailure() => 'Provider not found.',
        NetworkFailure() => 'No internet connection. Please try again.',
        ServerFailure() => 'Could not load provider. Please try again.',
        _ => 'Unexpected error. Please try again.',
      };
}
