import 'package:flutter/material.dart';

class AppTheme {
  // Primary gradient colors
  static const Color primaryPurple = Color(0xFF8A54E1);
  static const Color primaryBlue = Color(0xFF4485EB);
  
  // Dark mode colors
  static const Color darkPurple = Color(0xFF5E35B1);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  
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
  
  // Dark mode gradient background decoration
  static const BoxDecoration darkGradientBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        darkPurple,
        Color(0xFF303F9F), // Darker blue
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
  
  // Dark mode card styling
  static final BoxDecoration darkCardDecoration = BoxDecoration(
    color: darkSurface,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
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
  
  // Light theme
  static ThemeData getLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPurple,
        primary: primaryPurple,
        secondary: primaryBlue,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme().apply(
        bodyColor: textDark,
        displayColor: textDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPurple,
          foregroundColor: Colors.white,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryPurple,
          side: const BorderSide(color: primaryPurple),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryPurple,
        ),
      ),
    );
  }
  
  // Dark theme
  static ThemeData getDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkPurple,
        primary: darkPurple,
        secondary: primaryBlue,
        brightness: Brightness.dark,
        background: darkBackground,
        surface: darkSurface,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: darkBackground,
      textTheme: const TextTheme().apply(
        bodyColor: textLight,
        displayColor: textLight,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPurple,
          foregroundColor: Colors.white,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryBlue,
          side: const BorderSide(color: primaryBlue),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryBlue,
        ),
      ),
      cardColor: darkSurface,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: textLight,
      ),
    );
  }
}
