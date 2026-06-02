import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/router/app_routes.dart';
import 'package:medifinder_case_study/core/theme/app_colors.dart';
import 'package:medifinder_case_study/core/theme/app_radii.dart';
import 'package:medifinder_case_study/core/theme/app_spacing.dart';
import 'package:medifinder_case_study/core/widgets/empty_view.dart';
import 'package:medifinder_case_study/core/widgets/error_view.dart';
import 'package:medifinder_case_study/features/providers/data/debug/mock_failure_toggle.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list/provider_list_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list/provider_list_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list/provider_list_state.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/offline_banner.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/provider_card.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/type_chip.dart';
import 'package:skeletonizer/skeletonizer.dart';

const _listPadding = EdgeInsets.fromLTRB(
  0,
  AppSpacing.extraSmall,
  0,
  AppSpacing.large,
);

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
  ProviderType? _selectedType;

  static const _types = <(ProviderType?, String)>[
    (null, 'Tümü'),
    (ProviderType.doctor, 'Doktorlar'),
    (ProviderType.clinic, 'Klinikler'),
    (ProviderType.hospital, 'Hastaneler'),
  ];

  static const _chipRowHeight = 56.0;
  static const _chipRowPadding = EdgeInsets.symmetric(
    horizontal: AppSpacing.large,
    vertical: 10,
  );

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
            height: _chipRowHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: _chipRowPadding,
              itemCount: _types.length,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.small),
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

  static const _padding = EdgeInsets.fromLTRB(20, 8, 12, 22);
  static const _titleGap = 2.0;
  static const _searchGap = 14.0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.headerStart, AppColors.headerEnd],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppRadii.header),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: _padding,
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
                          'Sağlık hizmeti bul',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: _titleGap),
                        Text(
                          'Güvenilir doktorlar, klinikler ve hastaneler',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  if (onDebugToggle != null)
                    IconButton(
                      tooltip: 'Çevrimdışı simüle et (debug)',
                      onPressed: onDebugToggle,
                      icon: const Icon(
                        Icons.bug_report_outlined,
                        color: Colors.white,
                      ),
                    ),
                  IconButton(
                    tooltip: 'Filtrele',
                    onPressed: onFilter,
                    icon: const Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: _searchGap),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadii.field),
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
                    hintText: 'İsim veya branşa göre ara',
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
                  'Sonuç bulunamadı.\nAramanı veya filtreleri değiştirmeyi dene.',
            ),
          ProviderListError(:final message) => ErrorView(
              message: message,
              onRetry: () => context
                  .read<ProviderListBloc>()
                  .add(const ProviderListEvent.refreshed()),
            ),
          ProviderListLoaded(:final providers, :final fromCache) => Column(
              children: [
                if (fromCache) const OfflineBanner(),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async => context
                        .read<ProviderListBloc>()
                        .add(const ProviderListEvent.refreshed()),
                    child: ListView.builder(
                      padding: _listPadding,
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
                ),
              ],
            ),
        };
      },
    );
  }
}

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
        padding: _listPadding,
        itemCount: 6,
        itemBuilder: (_, _) => ProviderCard(provider: fake, onTap: () {}),
      ),
    );
  }
}
