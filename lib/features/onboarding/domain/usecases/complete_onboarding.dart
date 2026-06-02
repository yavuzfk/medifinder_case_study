import 'package:medifinder_case_study/features/onboarding/domain/repositories/onboarding_repository.dart';

class CompleteOnboarding {
  const CompleteOnboarding(this._repository);
  final OnboardingRepository _repository;

  Future<void> call() => _repository.complete();
}
