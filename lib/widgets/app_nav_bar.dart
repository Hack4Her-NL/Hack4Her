import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';
import '../widgets/theme_toggle.dart';
import '../main.dart'; // Import for themeNotifier

class AppNavBar extends StatelessWidget {
  final String currentRoute;

  const AppNavBar({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < AppTheme.mobileBreakpoint;
    
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return Container(
          color: isDark ? AppTheme.darkSurface : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.home);
                },
                child: Row(
                  children: [
                    Text(
                      'Hack4Her',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark 
                            ? AppTheme.primaryPurple  // Purple in dark mode
                            : AppTheme.primaryBlue,   // Blue in light mode
                      ),
                    ),
                  ],
                ),
              ),
    
              // Navigation Links or Menu Button
              Row(
                children: [
                  // Theme toggle
                  const ThemeToggle(),
                  
                  if (isMobile)
                    IconButton(
                      icon: Icon(
                        Icons.menu, 
                        color: isDark 
                            ? AppTheme.primaryPurple  // Purple in dark mode
                            : AppTheme.primaryBlue,   // Blue in light mode
                      ),
                      onPressed: () {
                        _showMobileMenu(context);
                      },
                    )
                  else
                    Row(
                      children: AppRoutes.navigationItems
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, item['route']!);
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: currentRoute == item['route']
                                      ? (isDark 
                                          ? AppTheme.primaryPurple  // Purple in dark mode
                                          : AppTheme.primaryBlue)   // Blue in light mode
                                      : (isDark 
                                          ? AppTheme.textLight 
                                          : AppTheme.textDark),
                                ),
                                child: Text(
                                  item['title']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }

  void _showMobileMenu(BuildContext context) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          // Use StatefulBuilder to rebuild when theme changes in the modal
          final isDarkMode = themeNotifier.value == ThemeMode.dark;
          
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Theme toggle in mobile menu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dark Mode',
                        style: TextStyle(
                          color: isDarkMode 
                              ? AppTheme.textLight 
                              : AppTheme.textDark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Switch(
                        value: isDarkMode,
                        activeColor: AppTheme.primaryPurple,
                        onChanged: (value) {
                          themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
                          // Rebuild the sheet with new theme
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ...AppRoutes.navigationItems
                    .map(
                      (item) => ListTile(
                        title: Text(
                          item['title']!,
                          style: TextStyle(
                            color: currentRoute == item['route']
                                ? (isDarkMode 
                                    ? AppTheme.primaryPurple  // Purple in dark mode
                                    : AppTheme.primaryBlue)   // Blue in light mode
                                : (isDarkMode 
                                    ? AppTheme.textLight 
                                    : AppTheme.textDark),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context); // Close the menu
                          Navigator.pushNamed(context, item['route']!);
                        },
                      ),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
