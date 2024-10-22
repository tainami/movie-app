import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class MovieThemeData {
  static ThemeData primary() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundPlus,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(
          color: AppColors.light,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.regularGray,
        ),
        selectedIconTheme: IconThemeData(
          size: 24,
          color: AppColors.light,
        ),
        unselectedIconTheme: IconThemeData(
          size: 24,
          color: AppColors.regularGray,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.light,
        unselectedItemColor: AppColors.regularGray,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.workSans(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: AppColors.light,
        ),
        headlineMedium: GoogleFonts.workSans(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.light,
        ),
        headlineSmall: GoogleFonts.workSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.light,
        ),
        bodyLarge: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.light,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.light,
        ),
        bodySmall: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.light,
        ),
        labelLarge: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.light,
        ),
        labelMedium: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.light,
        ),
        labelSmall: GoogleFonts.openSans(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppColors.light,
        ),
      ),
    );
  }

  static ThemeData secondary() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundPlus,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.workSans(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        headlineMedium: GoogleFonts.workSans(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        headlineSmall: GoogleFonts.workSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        bodyLarge: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        bodySmall: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        labelLarge: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        labelMedium: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        labelSmall: GoogleFonts.openSans(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
      ),
    );
  }
}
