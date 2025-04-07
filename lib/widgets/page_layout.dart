import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../main.dart'; // Import for themeNotifier
import 'app_nav_bar.dart';
import 'app_footer.dart';

class PageLayout extends StatelessWidget {
  final String currentRoute;
  final Widget child;
  final bool showGradientHeader;
  final String? headerTitle;
  final Widget? headerContent;

  const PageLayout({
    super.key,
    required this.currentRoute,
    required this.child,
    this.showGradientHeader = false,
    this.headerTitle,
    this.headerContent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Navigation bar
          AppNavBar(currentRoute: currentRoute),

          // Main content (scrollable)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Optional gradient header section
                  if (showGradientHeader) _buildHeader(context),

                  // Main page content
                  child,

                  // Footer
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
          decoration: isDark
              ? AppTheme.darkGradientBackground 
              : AppTheme.gradientBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (headerTitle != null)
                Text(
                  headerTitle!,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (headerContent != null) headerContent!,
            ],
          ),
        );
      }
    );
  }
}
