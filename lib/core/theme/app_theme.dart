import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Triplova Brand Colors
  static const Color primary = Color(0xFF0A886F);
  static const Color primaryDark = Color(0xFF01291D);
  static const Color secondary = Color(0xFF105345);
  static const Color accent = Color(0xFF64B9AA);

  static ThemeData get light => FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: primary,
          primaryContainer: primaryDark,
          secondary: secondary,
          secondaryContainer: accent,
          tertiary: accent,
          appBarColor: primaryDark,
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
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: 'Inter',
      );

  static ThemeData get dark => FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: primary,
          primaryContainer: primaryDark,
          secondary: secondary,
          secondaryContainer: accent,
          tertiary: accent,
          appBarColor: primaryDark,
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
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: 'Inter',
      );
}
