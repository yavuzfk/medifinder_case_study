import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medifinder_case_study/features/onboarding/domain/entities/onboarding_slide.dart';

part 'onboarding_state.freezed.dart';

@freezed
sealed class OnboardingState with _$OnboardingState {
  const factory OnboardingState.inProgress({
    required List<OnboardingSlide> slides,
    required int index,
  }) = OnboardingInProgress;
  const factory OnboardingState.completed() = OnboardingCompleted;
}
