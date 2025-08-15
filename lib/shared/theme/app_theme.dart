import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: const Color(0xFF6A1B9A),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF6A1B9A),
        secondary: Color(0xFFD500F9),
        error: Color(0xFFB00020),
      ),
      textTheme: GoogleFonts.interTextTheme(
        const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF333333),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF6A1B9A),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
