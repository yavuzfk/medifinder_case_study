import 'package:flutter/material.dart';
import 'package:medifinder_case_study/core/theme/app_colors.dart';
import 'package:medifinder_case_study/core/theme/app_radii.dart';
import 'package:medifinder_case_study/core/theme/app_spacing.dart';
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

  static const _outerInset = EdgeInsets.symmetric(horizontal: 16, vertical: 6);
  static const _contentInset = 14.0;
  static const _avatarRadius = 26.0;
  static const _placeIconSize = 15.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final p = provider;

    return Padding(
      padding: _outerInset,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(_contentInset),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: _avatarRadius,
                  backgroundColor: AppColors.tagBg,
                  child: Icon(p.type.icon, color: AppColors.primary),
                ),
                const SizedBox(width: _contentInset),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              p.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          if (p.rating != null) ...[
                            const SizedBox(width: AppSpacing.small),
                            _Rating(value: p.rating!),
                          ],
                        ],
                      ),
                      const SizedBox(height: AppSpacing.small),
                      _Tag(text: p.category),
                      const SizedBox(height: AppSpacing.small),
                      Row(
                        children: [
                          const Icon(
                            Icons.place_outlined,
                            size: _placeIconSize,
                            color: AppColors.inkMuted,
                          ),
                          const SizedBox(width: AppSpacing.extraSmall),
                          Expanded(
                            child: Text(
                              '${p.city}, ${p.country}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: AppColors.inkMuted),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating({required this.value});
  final double value;

  static const _starSize = 16.0;
  static const _gap = 2.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, size: _starSize, color: AppColors.star),
        const SizedBox(width: _gap),
        Text(
          value.toStringAsFixed(1),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.text});
  final String text;

  static const _padding = EdgeInsets.symmetric(horizontal: 10, vertical: 4);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      decoration: BoxDecoration(
        color: AppColors.tagBg,
        borderRadius: BorderRadius.circular(AppRadii.badge),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.tagText,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
