import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/router/app_routes.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/is_onboarding_completed.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/presentation/pages/filter_page.dart';
import 'package:medifinder_case_study/features/providers/presentation/pages/provider_detail_page.dart';
import 'package:medifinder_case_study/features/providers/presentation/pages/provider_list_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.providerList,
  redirect: (context, state) {
    final onboarded = getIt<IsOnboardingCompleted>()();
    final atOnboarding = state.matchedLocation == AppRoutes.onboarding;
    if (!onboarded && !atOnboarding) return AppRoutes.onboarding;
    if (onboarded && atOnboarding) return AppRoutes.providerList;
    return null;
  },
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      name: AppRoutes.onboardingName,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.providerList,
      name: AppRoutes.providerListName,
      builder: (context, state) => const ProviderListPage(),
    ),
    GoRoute(
      path: AppRoutes.filter,
      name: AppRoutes.filterName,
      builder: (context, state) {
        final initial = state.extra as ProviderFilter?;
        return FilterPage(initialFilter: initial);
      },
    ),
    GoRoute(
      path: AppRoutes.providerDetail,
      name: AppRoutes.providerDetailName,
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return ProviderDetailPage(id: id);
      },
    ),
  ],
);
