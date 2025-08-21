import 'package:flutter/material.dart';

class AppColors {
  // Brand Accent (used in buttons, highlights, links)
  static const Color primaryBlue = Color(0xFF1565C0); // strong trust blue
  static const Color primaryBlueLight = Color(
    0xFF42A5F5,
  ); // hover/pressed state
  static const Color primaryBlueDark = Color(0xFF0D47A1); // darker shade
  static const Color grey = Color.fromARGB(255, 163, 163, 163); // darker shade

  // ---------- Light Theme ----------
  static const Color lightBackground = Color(0xFFF5F5F5); // soft gray bg
  static const Color lightSurface = Color(0xFFFFFFFF); // card/bg surface
  static const Color lightTextPrimary = Color(0xFF1C1C1C); // near black
  static const Color lightTextSecondary = Color(0xFF616161); // medium gray text
  static const Color lightDivider = Color(0xFFBDBDBD); // light gray divider

  // ---------- Dark Theme ----------
  static const Color darkBackground = Color(0xFF121212); // deep gray bg
  static const Color darkSurface = Color(0xFF1E1E1E); // card surface dark
  static const Color darkTextPrimary = Color(0xFFE0E0E0); // almost white
  static const Color darkTextSecondary = Color(0xFF9E9E9E); // muted gray text
  static const Color darkDivider = Color(0xFF424242); // dark divider
}
