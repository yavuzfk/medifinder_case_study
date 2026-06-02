import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:medifinder_case_study/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:medifinder_case_study/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:medifinder_case_study/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/complete_onboarding.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/get_onboarding_slides.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/is_onboarding_completed.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_bloc.dart';

void registerOnboardingFeature(GetIt gh) {
  gh
    ..registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSourceImpl(Hive.box<dynamic>('app')),
    )
    ..registerLazySingleton<OnboardingRepository>(
      () => OnboardingRepositoryImpl(gh()),
    )
    ..registerFactory(() => GetOnboardingSlides(gh()))
    ..registerFactory(() => CompleteOnboarding(gh()))
    ..registerFactory(() => IsOnboardingCompleted(gh()))
    ..registerFactory(
      () => OnboardingBloc(getSlides: gh(), completeOnboarding: gh()),
    );
}
