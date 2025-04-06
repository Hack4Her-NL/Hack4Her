import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';

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

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.home);
            },
            child: const Row(
              children: [
                Text(
                  'Hack4Her',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryPurple,
                  ),
                ),
              ],
            ),
          ),

          // Navigation Links or Menu Button
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.primaryPurple),
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
                              ? AppTheme.primaryPurple
                              : AppTheme.textDark,
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
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppRoutes.navigationItems
              .map(
                (item) => ListTile(
                  title: Text(
                    item['title']!,
                    style: TextStyle(
                      color: currentRoute == item['route']
                          ? AppTheme.primaryPurple
                          : AppTheme.textDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close the menu
                    Navigator.pushNamed(context, item['route']!);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
