import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:medifinder_case_study/features/onboarding/onboarding_store.dart';
import 'package:medifinder_case_study/features/providers/providers_di.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  _registerCore();
  registerProvidersFeature(getIt);
}

void _registerCore() {
  getIt.registerLazySingleton<OnboardingStore>(
    () => HiveOnboardingStore(Hive.box<dynamic>('app')),
  );
}
