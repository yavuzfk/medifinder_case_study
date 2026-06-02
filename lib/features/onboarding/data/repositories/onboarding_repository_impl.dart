import 'package:medifinder_case_study/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:medifinder_case_study/features/onboarding/domain/entities/onboarding_slide.dart';
import 'package:medifinder_case_study/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl(this._local);

  final OnboardingLocalDataSource _local;

  @override
  List<OnboardingSlide> getSlides() => _local.getSlides();

  @override
  bool get isCompleted => _local.isCompleted;

  @override
  Future<void> complete() => _local.markCompleted();
}
