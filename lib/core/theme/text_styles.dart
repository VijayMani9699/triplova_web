import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headings - Playfair Display (Serif)
  static TextStyle h1({required bool isDark}) => GoogleFonts.playfairDisplay(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.darkText : AppColors.lightText,
        letterSpacing: -0.5,
      );

  static TextStyle h2({required bool isDark}) => GoogleFonts.playfairDisplay(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: isDark ? AppColors.darkText : AppColors.lightText,
      );

  static TextStyle h3({required bool isDark}) => GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: isDark ? AppColors.darkText : AppColors.lightText,
      );

  // Body - Montserrat (Sans-serif)
  static TextStyle bodyL({required bool isDark}) => GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: isDark ? AppColors.darkText : AppColors.lightText,
        height: 1.6,
      );

  static TextStyle bodyM({required bool isDark}) => GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: isDark ? AppColors.darkText : AppColors.lightText,
        height: 1.5,
      );

  static TextStyle bodyS({required bool isDark}) => GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
      );

  // Luxury Accents
  static TextStyle goldLabel = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.gold,
    letterSpacing: 2.0,
    textStyle: const TextStyle(fontStyle: FontStyle.italic),
  );
}
