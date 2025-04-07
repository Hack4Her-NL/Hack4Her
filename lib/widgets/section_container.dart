import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../main.dart'; // Import for themeNotifier

class SectionContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final bool useGradientBackground;
  final EdgeInsetsGeometry padding;
  final CrossAxisAlignment alignment;

  const SectionContainer({
    super.key,
    required this.title,
    required this.child,
    this.useGradientBackground = false,
    this.padding = const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
    this.alignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return Container(
          width: double.infinity,
          decoration: useGradientBackground
              ? (isDark
                  ? AppTheme.darkGradientBackground
                  : AppTheme.gradientBackground)
              : null,
          padding: padding,
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: useGradientBackground
                      ? Colors.white
                      : (isDark ? Colors.white : AppTheme.textDark),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              child,
            ],
          ),
        );
      },
    );
  }
}
