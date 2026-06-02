import 'package:medifinder_case_study/features/onboarding/domain/repositories/onboarding_repository.dart';

class IsOnboardingCompleted {
  const IsOnboardingCompleted(this._repository);
  final OnboardingRepository _repository;

  bool call() => _repository.isCompleted;
}
