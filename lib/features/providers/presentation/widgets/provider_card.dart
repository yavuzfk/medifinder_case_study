import 'package:flutter/material.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/provider_type_x.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({
    required this.provider,
    required this.onTap,
    super.key,
  });

  final Provider provider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.secondaryContainer,
          child: Icon(
            provider.type.icon,
            color: theme.colorScheme.onSecondaryContainer,
          ),
        ),
        title: Text(
          provider.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${provider.type.label} · ${provider.category}\n'
          '${provider.city}, ${provider.country}',
        ),
        isThreeLine: true,
        trailing: provider.rating == null
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 16, color: theme.colorScheme.primary),
                  const SizedBox(width: 2),
                  Text(provider.rating!.toStringAsFixed(1)),
                ],
              ),
      ),
    );
  }
}
