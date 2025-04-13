import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../main.dart'; // Import for themeNotifier

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDarkMode = themeMode == ThemeMode.dark;
        
        return IconButton(
          icon: Icon(
            isDarkMode ? Icons.wb_sunny_outlined : Icons.nights_stay_outlined,
            color: isDarkMode ? Colors.amber : AppTheme.primaryBlue,
          ),
          tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          onPressed: () {
            // Toggle theme
            themeNotifier.value = 
                themeNotifier.value == ThemeMode.light 
                ? ThemeMode.dark 
                : ThemeMode.light;
          },
        );
      }
    );
  }
} 