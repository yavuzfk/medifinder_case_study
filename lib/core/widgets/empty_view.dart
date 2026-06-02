import 'package:flutter/material.dart';
import 'package:medifinder_case_study/core/theme/app_icon_size.dart';
import 'package:medifinder_case_study/core/theme/app_spacing.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    required this.message,
    this.icon = Icons.search_off,
    super.key,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.extraLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppIconSize.extraLarge,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(height: AppSpacing.large),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
