import 'package:medifinder_case_study/features/onboarding/domain/entities/onboarding_slide.dart';
import 'package:medifinder_case_study/features/onboarding/domain/repositories/onboarding_repository.dart';

class GetOnboardingSlides {
  const GetOnboardingSlides(this._repository);
  final OnboardingRepository _repository;

  List<OnboardingSlide> call() => _repository.getSlides();
}
