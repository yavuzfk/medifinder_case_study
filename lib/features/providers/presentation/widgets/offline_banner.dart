import 'package:flutter/material.dart';
import 'package:medifinder_case_study/core/theme/app_colors.dart';
import 'package:medifinder_case_study/core/theme/app_icon_size.dart';
import 'package:medifinder_case_study/core/theme/app_spacing.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.star.withValues(alpha: 0.16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.large,
          vertical: AppSpacing.small,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.cloud_off_outlined,
              size: AppIconSize.small,
              color: AppColors.ink,
            ),
            const SizedBox(width: AppSpacing.small),
            Expanded(
              child: Text(
                'Çevrimdışı — önbellekten gösteriliyor',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
