import 'package:flutter/material.dart';
import 'package:medifinder_case_study/core/theme/app_colors.dart';
import 'package:medifinder_case_study/core/theme/app_radii.dart';

class TypeChip extends StatelessWidget {
  const TypeChip({
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  static const _padding = EdgeInsets.symmetric(horizontal: 18, vertical: 9);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.chip),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: _padding,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(AppRadii.chip),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : AppColors.ink,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
