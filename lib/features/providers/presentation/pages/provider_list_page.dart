import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/router/app_routes.dart';
import 'package:medifinder_case_study/core/theme/app_theme.dart';
import 'package:medifinder_case_study/core/widgets/empty_view.dart';
import 'package:medifinder_case_study/core/widgets/error_view.dart';
import 'package:medifinder_case_study/features/providers/data/debug/mock_failure_toggle.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list_state.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/provider_card.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/type_chip.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
  ProviderType? _selectedType; // yalnızca chip'lerle değişir

  static const _types = <(ProviderType?, String)>[
    (null, 'All'),
    (ProviderType.doctor, 'Doctors'),
    (ProviderType.clinic, 'Clinics'),
    (ProviderType.hospital, 'Hospitals'),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  ProviderListBloc get _bloc => context.read<ProviderListBloc>();

  void _selectType(ProviderType? type) {
    setState(() => _selectedType = type);
    _bloc.add(ProviderListEvent.typeSelected(type));
  }

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
      body: Column(
        children: [
          _Header(
            controller: _searchController,
            onSearch: (v) => _bloc.add(ProviderListEvent.searchChanged(v)),
            onFilter: _openFilter,
            onDebugToggle: kDebugMode
                ? () {
                    toggleMockFailure(getIt);
                    _bloc.add(const ProviderListEvent.refreshed());
                  }
                : null,
          ),
          SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: _types.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final (type, label) = _types[i];
                return TypeChip(
                  label: label,
                  selected: _selectedType == type,
                  onTap: () => _selectType(type),
                );
              },
            ),
          ),
          const Expanded(child: _ProviderListBody()),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.controller,
    required this.onSearch,
    required this.onFilter,
    this.onDebugToggle,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSearch;
  final VoidCallback onFilter;
  final VoidCallback? onDebugToggle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.headerStart, AppColors.headerEnd],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 12, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find a provider',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Trusted doctors, clinics & hospitals',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  if (onDebugToggle != null)
                    IconButton(
                      tooltip: 'Toggle mock failure (debug)',
                      onPressed: onDebugToggle,
                      icon: const Icon(
                        Icons.bug_report_outlined,
                        color: Colors.white,
                      ),
                    ),
                  IconButton(
                    tooltip: 'Filter',
                    onPressed: onFilter,
                    icon: const Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: TextField(
                  controller: controller,
                  onChanged: onSearch,
                  decoration: const InputDecoration(
                    hintText: 'Search by name or specialty',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ),
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
          ProviderListInitial() ||
          ProviderListLoading() =>
            const _ProviderListSkeleton(),
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
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 16),
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

/// Loading state'inde gerçek kart düzenini taklit eden iskelet liste.
class _ProviderListSkeleton extends StatelessWidget {
  const _ProviderListSkeleton();

  @override
  Widget build(BuildContext context) {
    final fake = Provider(
      id: '',
      name: BoneMock.name,
      type: ProviderType.doctor,
      category: BoneMock.words(2),
      country: BoneMock.name,
      city: BoneMock.name,
      rating: 4.8,
    );
    return Skeletonizer(
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 16),
        itemCount: 6,
        itemBuilder: (_, _) => ProviderCard(provider: fake, onTap: () {}),
      ),
    );
  }
}
