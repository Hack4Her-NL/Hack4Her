import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';
import '../widgets/page_layout.dart';
import '../widgets/section_container.dart';

class PreviousEventsScreen extends StatelessWidget {
  const PreviousEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppRoutes.previousEvents,
      showGradientHeader: true,
      headerTitle: 'Previous Events',
      headerContent: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          'Explore our past hackathons and the amazing projects created',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      child: Column(
        children: [
          // Overview Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Hack4Her has a rich history of inspiring innovation and empowering women in technology. Browse through our previous events to see the incredible projects and moments from past years.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.registration);
                  },
                  style: AppTheme.primaryButtonStyle,
                  child: const Text(
                    'Join Our Next Event',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Previous events timeline
          SectionContainer(
            title: 'Event History',
            useGradientBackground: true,
            child: _buildTimeline(context),
          ),

          // Featured Projects
          const SectionContainer(
            title: 'Featured Projects',
            child: Column(
              children: [
                _ProjectCard(
                  title: 'HealthTrack',
                  description:
                      'A mobile application for tracking women\'s health metrics and providing personalized wellness recommendations.',
                  year: '2023',
                  team: 'Team Innovate',
                  award: 'Grand Prize Winner',
                  imageUrl: null,
                ),
                _ProjectCard(
                  title: 'EdTech for Girls',
                  description:
                      'An interactive platform designed to engage young girls in STEM subjects through gamification and personalized learning paths.',
                  year: '2022',
                  team: 'Code Queens',
                  award: 'Best Social Impact',
                  imageUrl: null,
                ),
                _ProjectCard(
                  title: 'SafeRoute',
                  description:
                      'A navigation app that helps women find the safest routes home using crowdsourced safety data and real-time monitoring.',
                  year: '2021',
                  team: 'Security First',
                  award: 'People\'s Choice Award',
                  imageUrl: null,
                ),
              ],
            ),
          ),

          // Photo Gallery
          SectionContainer(
            title: 'Photo Gallery',
            useGradientBackground: true,
            child: _buildPhotoGallery(context),
          ),

          // Old website link
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Looking for more details about our previous events?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                const Text(
                  'Visit our archive website to explore all past hackathons, project galleries, and detailed event information.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                OutlinedButton.icon(
                  onPressed: () {
                    _launchURL('https://example.com/previous-events');
                  },
                  icon: const Icon(Icons.history),
                  label: const Text('Visit Archive Website'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.primaryPurple,
                    side: const BorderSide(color: AppTheme.primaryPurple),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppTheme.mobileBreakpoint;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          const _TimelineEvent(
            year: '2023',
            title: 'Hack4Her: Journal of Memories',
            description:
                'Our 10th annual event with over 2,500 participants and 300+ projects focused on health technology and education.',
            stats: [
              {'label': 'Participants', 'value': '2,500+'},
              {'label': 'Projects', 'value': '300+'},
              {'label': 'Sponsors', 'value': '35'},
            ],
            isLeft: true,
          ),
          const _TimelineEvent(
            year: '2022',
            title: 'Hack4Her: Digital Transformation',
            description:
                'Focused on leveraging technology for social good, with special emphasis on accessibility and inclusion.',
            stats: [
              {'label': 'Participants', 'value': '2,200+'},
              {'label': 'Projects', 'value': '280+'},
              {'label': 'Sponsors', 'value': '30'},
            ],
            isLeft: false,
          ),
          const _TimelineEvent(
            year: '2021',
            title: 'Hack4Her: Virtual Edition',
            description:
                'Our first fully virtual hackathon, bringing together participants from over 40 countries during the pandemic.',
            stats: [
              {'label': 'Participants', 'value': '1,800+'},
              {'label': 'Projects', 'value': '250+'},
              {'label': 'Sponsors', 'value': '25'},
            ],
            isLeft: true,
          ),
          const _TimelineEvent(
            year: '2020',
            title: 'Hack4Her: Future Forward',
            description:
                'Exploring the future of technology with a focus on AI, machine learning, and emerging technologies.',
            stats: [
              {'label': 'Participants', 'value': '1,500+'},
              {'label': 'Projects', 'value': '200+'},
              {'label': 'Sponsors', 'value': '20'},
            ],
            isLeft: false,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: OutlinedButton.icon(
              onPressed: () {
                _launchURL('https://example.com/event-history');
              },
              icon: const Icon(Icons.history, color: Colors.white),
              label: const Text('View Full History'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGallery(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppTheme.mobileBreakpoint;
    final double imageHeight = isMobile ? 150 : 250;

    return Column(
      children: [
        SizedBox(
          height: imageHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                width: imageHeight * 1.5,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Event Photo ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: imageHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                width: imageHeight * 1.5,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Event Photo ${index + 7}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: () {
            _launchURL('https://example.com/photo-gallery');
          },
          icon: const Icon(Icons.photo_library, color: Colors.white),
          label: const Text('View More Photos'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
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

class _TimelineEvent extends StatelessWidget {
  final String year;
  final String title;
  final String description;
  final List<Map<String, String>> stats;
  final bool isLeft;

  const _TimelineEvent({
    required this.year,
    required this.title,
    required this.description,
    required this.stats,
    this.isLeft = true,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppTheme.mobileBreakpoint;

    // On mobile, always use vertical layout
    if (isMobile) {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Year bubble
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  year,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryPurple,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: stats
                        .map(
                          (stat) => Column(
                            children: [
                              Text(
                                stat['value']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                stat['label']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Desktop layout with alternating sides
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          // Left content
          if (isLeft)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 15),
                    // Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: stats
                          .map(
                            (stat) => Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  Text(
                                    stat['value']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    stat['label']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(child: Container()),

          // Center year bubble
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                year,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryPurple,
                ),
              ),
            ),
          ),

          // Right content
          if (!isLeft)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Stats
                    Row(
                      children: stats
                          .map(
                            (stat) => Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Text(
                                    stat['value']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    stat['label']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(child: Container()),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String year;
  final String team;
  final String award;
  final String? imageUrl;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.year,
    required this.team,
    required this.award,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Container(
              width: 150,
              height: 200,
              color: AppTheme.primaryPurple.withOpacity(0.1),
              child: Center(
                child: imageUrl != null
                    ? Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 200,
                      )
                    : const Icon(
                        Icons.image,
                        size: 50,
                        color: AppTheme.primaryPurple,
                      ),
              ),
            ),
          ),
          // Project details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryPurple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          year,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.people, size: 16, color: Colors.grey[700]),
                      const SizedBox(width: 5),
                      Text(
                        team,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.emoji_events, size: 16, color: Colors.amber),
                      const SizedBox(width: 5),
                      Text(
                        award,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.launch, size: 16),
                    label: const Text('View Project'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
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
}
