import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get light => FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: AppColors.primary,
          primaryContainer: AppColors.primaryDark,
          secondary: AppColors.gold,
          secondaryContainer: AppColors.champagne,
          tertiary: AppColors.accent,
          appBarColor: AppColors.primaryDark,
        ),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 10,
        appBarStyle: FlexAppBarStyle.primary,
        bottomAppBarElevation: 1.0,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
          useMaterial3Typography: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          elevatedButtonRadius: 12,
          cardRadius: 16,
          inputDecoratorRadius: 12,
          inputDecoratorUnfocusedHasBorder: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ).copyWith(
        extensions: [
          LuxuryThemeExtension.light(),
        ],
      );

  static ThemeData get dark => FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: AppColors.primary,
          primaryContainer: AppColors.primaryDark,
          secondary: AppColors.gold,
          secondaryContainer: AppColors.champagne,
          tertiary: AppColors.accent,
          appBarColor: AppColors.primaryDark,
        ).toDark(),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        bottomAppBarElevation: 2.0,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
          useMaterial3Typography: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          elevatedButtonRadius: 12,
          cardRadius: 16,
          inputDecoratorRadius: 12,
          inputDecoratorUnfocusedHasBorder: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ).copyWith(
        extensions: [
          LuxuryThemeExtension.dark(),
        ],
      );
}

/// Custom ThemeExtension for premium luxury elements like glassmorphism
class LuxuryThemeExtension extends ThemeExtension<LuxuryThemeExtension> {
  final Color glassColor;
  final Color glassBorder;
  final double blur;

  LuxuryThemeExtension({
    required this.glassColor,
    required this.glassBorder,
    required this.blur,
  });

  factory LuxuryThemeExtension.light() => LuxuryThemeExtension(
        glassColor: Colors.white.withAlpha(26),
        glassBorder: Colors.white.withAlpha(51),
        blur: 10,
      );

  factory LuxuryThemeExtension.dark() => LuxuryThemeExtension(
        glassColor: Colors.black.withAlpha(51),
        glassBorder: Colors.white.withAlpha(26),
        blur: 15,
      );

  @override
  LuxuryThemeExtension copyWith({
    Color? glassColor,
    Color? glassBorder,
    double? blur,
  }) {
    return LuxuryThemeExtension(
      glassColor: glassColor ?? this.glassColor,
      glassBorder: glassBorder ?? this.glassBorder,
      blur: blur ?? this.blur,
    );
  }

  @override
  LuxuryThemeExtension lerp(ThemeExtension<LuxuryThemeExtension>? other, double t) {
    if (other is! LuxuryThemeExtension) return this;
    return LuxuryThemeExtension(
      glassColor: Color.lerp(glassColor, other.glassColor, t)!,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t)!,
      blur: (blur + (other.blur - blur) * t),
    );
  }

}
