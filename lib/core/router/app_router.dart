import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/router/app_routes.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/presentation/pages/filter_page.dart';
import 'package:medifinder_case_study/features/providers/presentation/pages/provider_list_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.providerList,
  routes: [
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
      // TODO(yavuzfk): replace with ProviderDetailPage(id: id) in feat/provider-detail
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return _PlaceholderPage(title: 'Provider Detail · $id');
      },
    ),
  ],
);

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
