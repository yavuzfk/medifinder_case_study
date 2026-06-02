import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_event.freezed.dart';

@freezed
sealed class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.pageChanged(int index) = OnboardingPageChanged;
  const factory OnboardingEvent.nextPressed() = OnboardingNextPressed;
  const factory OnboardingEvent.skipped() = OnboardingSkipped;
}
