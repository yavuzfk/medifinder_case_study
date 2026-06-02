import 'package:flutter/material.dart';
import 'package:medifinder_case_study/core/theme/app_theme.dart';

/// Veri cache'ten (bayat) gösterilirken üstte beliren ince çubuk.
class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.star.withValues(alpha: 0.16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const Icon(Icons.cloud_off_outlined, size: 18, color: AppColors.ink),
            const SizedBox(width: 8),
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
