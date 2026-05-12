import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors
  static const Color primary = Color(0xFF0A886F);
  static const Color primaryDark = Color(0xFF01291D);
  static const Color secondary = Color(0xFF105345);
  static const Color accent = Color(0xFF64B9AA);
  static const Color gold = Color(0xFFD4AF37); // Luxury Gold for highlights
  static const Color footerBg = Color(0xFF012148); // Deep Navy Blue for footer

  // Light Mode Colors
  static const Color lightBg = Color(0xFFF6F9F8); // Sophisticated Minty White
  static const Color lightSurface = Colors.white;
  static const Color lightText = Color(0xFF141C1B); // Slightly greenish dark text
  static const Color lightTextSecondary = Color(0xFF5A6664);

  // Dark Mode Colors
  static const Color darkBg = Color(0xFF0D1413); // Deep Forest Onyx
  static const Color darkSurface = Color(0xFF151D1C);
  static const Color darkText = Color(0xFFE8EFEE);
  static const Color darkTextSecondary = Color(0xFF9AACAA);

  // Glassmorphism Overlay
  static Color glassWhite(double opacity) => Colors.white.withAlpha((opacity * 255).round());
  static Color glassBlack(double opacity) => Colors.black.withAlpha((opacity * 255).round());
}
