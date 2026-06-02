import 'package:get_it/get_it.dart';
import 'package:medifinder_case_study/features/onboarding/onboarding_di.dart';
import 'package:medifinder_case_study/features/providers/providers_di.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  registerOnboardingFeature(getIt);
  registerProvidersFeature(getIt);
}
