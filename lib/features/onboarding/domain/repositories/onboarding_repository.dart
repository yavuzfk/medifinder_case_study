import 'package:medifinder_case_study/features/onboarding/domain/entities/onboarding_slide.dart';

abstract interface class OnboardingRepository {
  List<OnboardingSlide> getSlides();
  bool get isCompleted;
  Future<void> complete();
}
