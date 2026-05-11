import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors
  static const Color primary = Color(0xFF0A886F);
  static const Color primaryDark = Color(0xFF01291D);
  static const Color secondary = Color(0xFF105345);
  static const Color accent = Color(0xFF64B9AA);
  static const Color gold = Color(0xFFD4AF37); // Luxury Gold for highlights

  // Light Mode Colors
  static const Color lightBg = Color(0xFFFDFCFB); // Soft Cream
  static const Color lightSurface = Colors.white;
  static const Color lightText = Color(0xFF1A1A1A);
  static const Color lightTextSecondary = Color(0xFF757575);

  // Dark Mode Colors
  static const Color darkBg = Color(0xFF0A0A0A); // Rich Black
  static const Color darkSurface = Color(0xFF161616);
  static const Color darkText = Color(0xFFF5F5F5);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);

  // Glassmorphism Overlay
  static Color glassWhite(double opacity) => Colors.white.withAlpha((opacity * 255).round());
  static Color glassBlack(double opacity) => Colors.black.withAlpha((opacity * 255).round());
}
