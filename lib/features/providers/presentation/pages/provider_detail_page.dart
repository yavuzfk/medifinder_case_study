import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
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
        appBar: AppBar(title: const Text('Provider Details')),
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
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: theme.colorScheme.secondaryContainer,
              child: Icon(
                p.type.icon,
                size: 36,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                p.name,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${p.type.label} · ${p.category}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (p.rating != null) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, size: 18, color: theme.colorScheme.primary),
                  const SizedBox(width: 4),
                  Text(p.rating!.toStringAsFixed(1)),
                ],
              ),
            ],
          ],
        ),
        const SizedBox(height: 24),
        const _SectionTitle('Location'),
        ListTile(
          leading: const Icon(Icons.place_outlined),
          title: Text('${p.city}, ${p.country}'),
          dense: true,
        ),
        const SizedBox(height: 8),
        const _SectionTitle('Contact'),
        if (contactRows.isEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'No contact information available.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          )
        else
          ...contactRows,
        if (p.bio != null) ...[
          const SizedBox(height: 8),
          const _SectionTitle('About'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(p.bio!, style: theme.textTheme.bodyLarge),
          ),
        ],
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Text(
        title.toUpperCase(),
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.primary,
          letterSpacing: 0.8,
        ),
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
      leading: Icon(icon),
      title: Text(value),
      dense: true,
    );
  }
}
