import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
    return Column(
      children: [
        // Main contributors (full-sized cards)
        const Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: [
            _TeamMemberCard(
              name: 'Jane Doe',
              role: 'Director',
              assetImagePath: 'assets/images/face0.png',
              linkedInUrl: 'https://linkedin.com',
            ),
            _TeamMemberCard(
              name: 'John Smith',
              role: 'Technical Lead',
              assetImagePath: 'assets/images/face1.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
          ],
        ),
        
        const SizedBox(height: 40),
        
        // Section divider with text
        Row(
          children: [
            const Expanded(child: Divider(color: Colors.white30)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Team Members',
                style: TextStyle(
                  color: Colors.white.withAlpha(179),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Expanded(child: Divider(color: Colors.white30)),
          ],
        ),
        
        const SizedBox(height: 30),
        
        // Regular team members (compact cards)
        const Wrap(
          spacing: 15,
          runSpacing: 15,
          alignment: WrapAlignment.center,
          children: [
            _CompactTeamMemberCard(
              name: 'Alice Johnson',
              role: 'Marketing',
              assetImagePath: 'assets/images/face2.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Bob Williams',
              role: 'Design Lead',
              assetImagePath: 'assets/images/face3.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Carol Brown',
              role: 'Operations',
              assetImagePath: 'assets/images/face4.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'David Lee',
              role: 'Sponsorship',
              assetImagePath: 'assets/images/face5.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Emma Wilson',
              role: 'Developer',
              assetImagePath: 'assets/images/face6.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Frank Taylor',
              role: 'UX Designer',
              assetImagePath: 'assets/images/face7.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Grace Kim',
              role: 'Project Manager',
              assetImagePath: 'assets/images/face8.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Henry Chen',
              role: 'Developer',
              assetImagePath: 'assets/images/face9.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Irene Lopez',
              role: 'Marketing',
              assetImagePath: 'assets/images/face10.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Jack Brown',
              role: 'Content Writer',
              assetImagePath: 'assets/images/face0.png',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Katie Smith',
              role: 'UI Designer',
              assetImagePath: 'assets/images/face1.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Leo Wang',
              role: 'Backend Dev',
              assetImagePath: 'assets/images/face2.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Mia Johnson',
              role: 'Community Manager',
              assetImagePath: 'assets/images/face3.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Nathan Park',
              role: 'Designer',
              assetImagePath: 'assets/images/face4.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Olivia King',
              role: 'Social Media',
              assetImagePath: 'assets/images/face5.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
            _CompactTeamMemberCard(
              name: 'Paul Rodriguez',
              role: 'Volunteer Coord',
              assetImagePath: 'assets/images/face6.jpg',
              linkedInUrl: 'https://linkedin.com',
            ),
          ],
        ),
      ],
    );
  }
}

class _TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String? assetImagePath;
  final String linkedInUrl;

  const _TeamMemberCard({
    required this.name,
    required this.role,
    this.assetImagePath,
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
                image: assetImagePath != null
                    ? DecorationImage(
                        image: AssetImage(assetImagePath!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: assetImagePath == null
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

// Compact card for regular team members
class _CompactTeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String? assetImagePath;
  final String linkedInUrl;

  const _CompactTeamMemberCard({
    required this.name,
    required this.role,
    this.assetImagePath,
    required this.linkedInUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _launchURL(linkedInUrl),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile icon or image
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                    image: assetImagePath != null
                        ? DecorationImage(
                            image: AssetImage(assetImagePath!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: assetImagePath == null
                      ? const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        )
                      : null,
                ),
                const SizedBox(height: 10),
                // Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Role
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                // LinkedIn icon
                Icon(
                  Icons.link,
                  color: Colors.white.withOpacity(0.7),
                  size: 14,
                ),
              ],
            ),
          ),
        ),
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
