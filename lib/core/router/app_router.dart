import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/router/app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.providerList,
  routes: [
    GoRoute(
      path: AppRoutes.providerList,
      name: AppRoutes.providerListName,
      // TODO(feat/provider-list): const ProviderListPage() ile değiştir
      builder: (context, state) =>
          const _PlaceholderPage(title: 'Provider List'),
    ),
    GoRoute(
      path: AppRoutes.filter,
      name: AppRoutes.filterName,
      // TODO(feat/filter): const FilterPage() ile değiştir
      builder: (context, state) => const _PlaceholderPage(title: 'Filter'),
    ),
    GoRoute(
      path: AppRoutes.providerDetail,
      name: AppRoutes.providerDetailName,
      // TODO(feat/provider-detail): ProviderDetailPage(id: id) ile değiştir
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
