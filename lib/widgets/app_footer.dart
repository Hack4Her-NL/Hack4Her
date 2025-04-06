import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < AppTheme.mobileBreakpoint;

    return Container(
      decoration: AppTheme.gradientBackground,
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

          // Sponsors section (placeholder)
          const Text(
            'Sponsors',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // Sponsor logos (placeholders)
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: List.generate(
              4,
              (index) => Container(
                width: 120,
                height: 60,
                color: Colors.white.withOpacity(0.2),
                child: Center(
                  child: Text(
                    'Sponsor ${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
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
  }

  Widget _buildSection(String title, List<String> items, bool isMobile) {
    return Column(
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
          spacing: 20,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: items
              .map(
                (item) => TextButton(
                  onPressed: () {
                    // Placeholder for link actions
                    _launchURL('https://example.com');
                  },
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 18,
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
