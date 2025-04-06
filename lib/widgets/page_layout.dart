import 'package:flutter/material.dart';
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
                  if (showGradientHeader) _buildHeader(),

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

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF8A54E1), // Purple
            Color(0xFF4485EB), // Blue
          ],
        ),
      ),
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
}
