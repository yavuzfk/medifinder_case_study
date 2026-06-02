import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medifinder_case_study/core/theme/app_colors.dart';
import 'package:medifinder_case_study/core/theme/app_radii.dart';

abstract final class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ).copyWith(surface: Colors.white);

    final base = ThemeData(useMaterial3: true, colorScheme: scheme);
    final textTheme = GoogleFonts.interTextTheme(
      base.textTheme,
    ).apply(bodyColor: AppColors.ink, displayColor: AppColors.ink);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.scaffold,
      textTheme: textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        elevation: 1.5,
        color: Colors.white,
        shadowColor: Colors.black.withValues(alpha: 0.06),
        surfaceTintColor: Colors.transparent,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: _rounded(AppRadii.card),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        prefixIconColor: AppColors.primary,
        hintStyle: const TextStyle(color: AppColors.inkMuted),
        border: _fieldBorder(),
        enabledBorder: _fieldBorder(),
        focusedBorder: _fieldBorder(
          const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: _rounded(AppRadii.field),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        space: 1,
        thickness: 1,
      ),
    );
  }

  static RoundedRectangleBorder _rounded(double radius) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));

  static OutlineInputBorder _fieldBorder([BorderSide side = BorderSide.none]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.field),
        borderSide: side,
      );
}
