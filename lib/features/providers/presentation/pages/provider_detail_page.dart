import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/theme/app_colors.dart';
import 'package:medifinder_case_study/core/theme/app_icon_size.dart';
import 'package:medifinder_case_study/core/theme/app_radii.dart';
import 'package:medifinder_case_study/core/theme/app_spacing.dart';
import 'package:medifinder_case_study/core/widgets/error_view.dart';
import 'package:medifinder_case_study/core/widgets/loading_view.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail/provider_detail_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail/provider_detail_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail/provider_detail_state.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/offline_banner.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/provider_type_x.dart';

class ProviderDetailPage extends StatelessWidget {
  const ProviderDetailPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProviderDetailBloc>()..add(ProviderDetailEvent.started(id)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<ProviderDetailBloc, ProviderDetailState>(
          builder: (context, state) {
            return switch (state) {
              ProviderDetailLoading() => const LoadingView(),
              ProviderDetailError(:final message) => ErrorView(
                  message: message,
                  onRetry: () => context
                      .read<ProviderDetailBloc>()
                      .add(const ProviderDetailEvent.retried()),
                ),
              ProviderDetailLoaded(:final provider, :final fromCache) =>
                ProviderDetailContent(provider: provider, fromCache: fromCache),
            };
          },
        ),
      ),
    );
  }
}

class ProviderDetailContent extends StatelessWidget {
  const ProviderDetailContent({
    required this.provider,
    this.fromCache = false,
    super.key,
  });

  final Provider provider;
  final bool fromCache;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final p = provider;

    final contactRows = <Widget>[
      if (p.phone != null)
        _ContactRow(icon: Icons.phone_outlined, value: p.phone!),
      if (p.email != null)
        _ContactRow(icon: Icons.email_outlined, value: p.email!),
      if (p.website != null)
        _ContactRow(icon: Icons.language_outlined, value: p.website!),
    ];

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _Hero(provider: p),
        if (fromCache) const OfflineBanner(),
        const SizedBox(height: AppSpacing.large),
        _Section(
          title: 'Konum',
          child: _ContactRow(
            icon: Icons.place_outlined,
            value: '${p.city}, ${p.country}',
          ),
        ),
        _Section(
          title: 'İletişim',
          child: contactRows.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(AppSpacing.large),
                  child: Text(
                    'İletişim bilgisi bulunmuyor.',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: AppColors.inkMuted),
                  ),
                )
              : Column(children: contactRows),
        ),
        if (p.bio != null)
          _Section(
            title: 'Hakkında',
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.large),
              child: Text(p.bio!, style: theme.textTheme.bodyLarge),
            ),
          ),
        const SizedBox(height: AppSpacing.extraLarge),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.provider});

  final Provider provider;

  static const _padding = EdgeInsets.fromLTRB(
    AppSpacing.large,
    AppSpacing.small,
    AppSpacing.large,
    AppSpacing.extraLarge,
  );
  static const _avatarRadius = 44.0;
  static const _nameTagGap = 6.0;
  static const _tagPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 5);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final p = provider;
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.headerStart, AppColors.headerEnd],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: _padding,
          child: Column(
            children: [
              CircleAvatar(
                radius: _avatarRadius,
                backgroundColor: Colors.white,
                child: Icon(
                  p.type.icon,
                  size: AppIconSize.large,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: AppSpacing.medium),
              Text(
                p.name,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: _nameTagGap),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppRadii.tag),
                ),
                child: Padding(
                  padding: _tagPadding,
                  child: Text(
                    '${p.type.label} · ${p.category}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              if (p.rating != null) ...[
                const SizedBox(height: AppSpacing.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      size: AppIconSize.small,
                      color: AppColors.star,
                    ),
                    const SizedBox(width: AppSpacing.extraSmall),
                    Text(
                      p.rating!.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

  static const _padding = EdgeInsets.fromLTRB(
    AppSpacing.large,
    AppSpacing.small,
    AppSpacing.large,
    AppSpacing.small,
  );
  static const _labelPadding = EdgeInsets.only(left: 4, bottom: 6);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: _labelPadding,
            child: Text(
              title.toUpperCase(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.primary,
                letterSpacing: 0.8,
              ),
            ),
          ),
          Card(child: child),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.icon, required this.value});
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(value),
      dense: true,
    );
  }
}
