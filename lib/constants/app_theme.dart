import 'package:flutter/material.dart';

class AppTheme {
  // Primary gradient colors
  static const Color primaryPurple = Color(0xFF8A54E1);
  static const Color primaryBlue = Color(0xFF4485EB);

  // Text colors
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Colors.white;

  // Default settings
  static const bool useGradientBackground = true;

  // Button styling
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryPurple,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white.withOpacity(0.2),
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  // Gradient background decoration
  static const BoxDecoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        primaryPurple,
        primaryBlue,
      ],
    ),
  );

  // Text styles
  static const TextStyle headingLarge = TextStyle(
    fontSize: 86,
    fontWeight: FontWeight.bold,
    color: textLight,
    letterSpacing: 2.0,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: textDark,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: textDark,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  // Card styling
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Responsive breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;

  // Helper method for responsive font sizing
  static double responsiveFontSize(double baseSize, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < mobileBreakpoint) {
      return baseSize * 0.6;
    } else if (screenWidth < tabletBreakpoint) {
      return baseSize * 0.8;
    }
    return baseSize;
  }
}
