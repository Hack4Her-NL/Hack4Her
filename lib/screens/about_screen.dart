import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';
import '../widgets/page_layout.dart';
import '../widgets/section_container.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppRoutes.about,
      showGradientHeader: true,
      headerTitle: 'About Us',
      headerContent: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          'Meet the amazing team behind Hack4Her',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      child: Column(
        children: [
          // Mission section
          const SectionContainer(
            title: 'Our Mission',
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Team section
          SectionContainer(
            title: 'Our Team',
            useGradientBackground: true,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
            child: _buildTeamGrid(context),
          ),

          // Vision section
          const SectionContainer(
            title: 'Our Vision',
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamGrid(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppTheme.mobileBreakpoint;

    return const Wrap(
      spacing: 30,
      runSpacing: 30,
      alignment: WrapAlignment.center,
      children: [
        _TeamMemberCard(
          name: 'Jane Doe',
          role: 'Director',
          imageUrl: null,
          linkedInUrl: 'https://linkedin.com',
        ),
        _TeamMemberCard(
          name: 'John Smith',
          role: 'Technical Lead',
          imageUrl: null,
          linkedInUrl: 'https://linkedin.com',
        ),
        _TeamMemberCard(
          name: 'Alice Johnson',
          role: 'Marketing',
          imageUrl: null,
          linkedInUrl: 'https://linkedin.com',
        ),
        _TeamMemberCard(
          name: 'Bob Williams',
          role: 'Design Lead',
          imageUrl: null,
          linkedInUrl: 'https://linkedin.com',
        ),
        _TeamMemberCard(
          name: 'Carol Brown',
          role: 'Operations',
          imageUrl: null,
          linkedInUrl: 'https://linkedin.com',
        ),
        _TeamMemberCard(
          name: 'David Lee',
          role: 'Sponsorship',
          imageUrl: null,
          linkedInUrl: 'https://linkedin.com',
        ),
      ],
    );
  }
}

class _TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String? imageUrl;
  final String linkedInUrl;

  const _TeamMemberCard({
    required this.name,
    required this.role,
    this.imageUrl,
    required this.linkedInUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile image or placeholder
          InkWell(
            onTap: () => _launchURL(linkedInUrl),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
                image: imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: imageUrl == null
                  ? const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          // Name
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          // Role
          Text(
            role,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // LinkedIn button
          InkWell(
            onTap: () => _launchURL(linkedInUrl),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.link, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    'LinkedIn',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
