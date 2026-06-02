import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/router/app_routes.dart';
import 'package:medifinder_case_study/core/widgets/empty_view.dart';
import 'package:medifinder_case_study/core/widgets/error_view.dart';
import 'package:medifinder_case_study/core/widgets/loading_view.dart';
import 'package:medifinder_case_study/features/providers/data/debug/mock_failure_toggle.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list_state.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/provider_card.dart';

class ProviderListPage extends StatelessWidget {
  const ProviderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProviderListBloc>()..add(const ProviderListEvent.started()),
      child: const _ProviderListView(),
    );
  }
}

class _ProviderListView extends StatefulWidget {
  const _ProviderListView();

  @override
  State<_ProviderListView> createState() => _ProviderListViewState();
}

class _ProviderListViewState extends State<_ProviderListView> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  ProviderListBloc get _bloc => context.read<ProviderListBloc>();

  Future<void> _openFilter() async {
    final filter = await context.pushNamed<ProviderFilter>(
      AppRoutes.filterName,
      extra: _bloc.currentFilter,
    );
    if (filter != null && mounted) {
      _bloc.add(ProviderListEvent.filterChanged(filter));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Providers'),
        actions: [
          if (kDebugMode)
            IconButton(
              tooltip: 'Toggle mock failure (debug)',
              icon: const Icon(Icons.bug_report_outlined),
              onPressed: () {
                toggleMockFailure(getIt);
                _bloc.add(const ProviderListEvent.refreshed());
              },
            ),
          IconButton(
            tooltip: 'Filter',
            icon: const Icon(Icons.tune),
            onPressed: _openFilter,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or specialty',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                isDense: true,
              ),
              onChanged: (value) =>
                  _bloc.add(ProviderListEvent.searchChanged(value)),
            ),
          ),
          const Expanded(child: _ProviderListBody()),
        ],
      ),
    );
  }
}

class _ProviderListBody extends StatelessWidget {
  const _ProviderListBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderListBloc, ProviderListState>(
      builder: (context, state) {
        return switch (state) {
          ProviderListInitial() || ProviderListLoading() => const LoadingView(),
          ProviderListEmpty() => const EmptyView(
              message:
                  'No providers found.\nTry adjusting your search or filters.',
            ),
          ProviderListError(:final message) => ErrorView(
              message: message,
              onRetry: () => context
                  .read<ProviderListBloc>()
                  .add(const ProviderListEvent.refreshed()),
            ),
          ProviderListLoaded(:final providers) => RefreshIndicator(
              onRefresh: () async => context
                  .read<ProviderListBloc>()
                  .add(const ProviderListEvent.refreshed()),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: providers.length,
                itemBuilder: (context, index) {
                  final provider = providers[index];
                  return ProviderCard(
                    provider: provider,
                    onTap: () => context.pushNamed(
                      AppRoutes.providerDetailName,
                      pathParameters: {'id': provider.id},
                    ),
                  );
                },
              ),
            ),
        };
      },
    );
  }
}
