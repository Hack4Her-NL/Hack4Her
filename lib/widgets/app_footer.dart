import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../main.dart'; // Import for themeNotifier
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < AppTheme.mobileBreakpoint;

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return Container(
          width: double.infinity,
          decoration: isDark
              ? AppTheme.darkGradientBackground 
              : AppTheme.gradientBackground,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Company section
              _buildSection(
                'Company',
                [
                  'About Us',
                  'Contact',
                  'Privacy Policy',
                ],
                isMobile,
              ),

              const SizedBox(height: 40),

              // Connect with us section
              _buildSection(
                'Connect with us',
                [
                  'Email',
                  'Facebook',
                  'Instagram',
                  'LinkedIn',
                  'Twitter',
                  'GitHub',
                ],
                isMobile,
              ),

              const SizedBox(height: 40),

              // Join the Community section
              _buildSection(
                'Join the Community',
                [
                  'Newsletter',
                  'Discord',
                ],
                isMobile,
              ),

              const SizedBox(height: 40),

              // Sponsors section
              const Text(
                'Sponsors',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // Sponsor logos using company images
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildSponsorLogo('assets/images/company0.png', 'Sponsor 1'),
                  _buildSponsorLogo('assets/images/company1.png', 'Sponsor 2'),
                  _buildSponsorLogo('assets/images/company2.png', 'Sponsor 3'),
                  _buildSponsorLogo('assets/images/company3.png', 'Sponsor 4'),
                ],
              ),

              const SizedBox(height: 60),

              // Made with love text
              const Text(
                'Made with love by Hack4Her Team',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSponsorLogo(String imagePath, String name) {
    return Container(
      width: 120,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 24,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: items
              .map(
                (item) => TextButton(
                  onPressed: () {
                    // Handle footer link clicks
                  },
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
