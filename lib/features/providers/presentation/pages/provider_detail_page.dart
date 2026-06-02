import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/theme/app_theme.dart';
import 'package:medifinder_case_study/core/widgets/error_view.dart';
import 'package:medifinder_case_study/core/widgets/loading_view.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail_state.dart';
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
              ProviderDetailLoaded(:final provider) =>
                ProviderDetailContent(provider: provider),
            };
          },
        ),
      ),
    );
  }
}

/// Bloc'tan bağımsız, saf görünüm. Null-handling'i widget testiyle
/// doğrulanabilir kılmak için ayrıldı.
class ProviderDetailContent extends StatelessWidget {
  const ProviderDetailContent({required this.provider, super.key});

  final Provider provider;

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
        const SizedBox(height: 16),
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
                  padding: const EdgeInsets.all(16),
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
              padding: const EdgeInsets.all(16),
              child: Text(p.bio!, style: theme.textTheme.bodyLarge),
            ),
          ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.provider});

  final Provider provider;

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
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 44,
                backgroundColor: Colors.white,
                child: Icon(p.type.icon, size: 40, color: AppColors.primary),
              ),
              const SizedBox(height: 12),
              Text(
                p.name,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
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
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, size: 18, color: AppColors.star),
                    const SizedBox(width: 4),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 6),
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
