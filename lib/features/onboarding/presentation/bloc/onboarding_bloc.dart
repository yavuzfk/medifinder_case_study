import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/complete_onboarding.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/get_onboarding_slides.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({
    required GetOnboardingSlides getSlides,
    required CompleteOnboarding completeOnboarding,
  })  : _completeOnboarding = completeOnboarding,
        super(OnboardingState.inProgress(slides: getSlides(), index: 0)) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingNextPressed>(_onNextPressed);
    on<OnboardingSkipped>(_onSkipped);
  }

  final CompleteOnboarding _completeOnboarding;

  void _onPageChanged(OnboardingPageChanged event, Emitter<OnboardingState> emit) {
    final state = this.state;
    if (state is OnboardingInProgress) {
      emit(state.copyWith(index: event.index));
    }
  }

  Future<void> _onNextPressed(
    OnboardingNextPressed event,
    Emitter<OnboardingState> emit,
  ) async {
    final state = this.state;
    if (state is! OnboardingInProgress) return;
    if (state.index >= state.slides.length - 1) {
      await _complete(emit);
    } else {
      emit(state.copyWith(index: state.index + 1));
    }
  }

  Future<void> _onSkipped(
    OnboardingSkipped event,
    Emitter<OnboardingState> emit,
  ) => _complete(emit);

  Future<void> _complete(Emitter<OnboardingState> emit) async {
    await _completeOnboarding();
    emit(const OnboardingState.completed());
  }
}
