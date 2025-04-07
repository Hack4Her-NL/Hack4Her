import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';
import '../widgets/page_layout.dart';
import '../widgets/section_container.dart';
import '../main.dart'; // Import for themeNotifier

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
                ValueListenableBuilder<ThemeMode>(
                  valueListenable: themeNotifier,
                  builder: (context, themeMode, _) {
                    final isDark = themeMode == ThemeMode.dark;
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.registration);
                      },
                      style: AppTheme.getPrimaryButtonStyle(context, isDark),
                      child: const Text(
                        'Join Our Next Event',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
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
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          _TimelineEvent(
            year: '2025',
            title: 'Hack4Her: 4th Annual Event',
            description:
                'Upcoming event scheduled for June 13-15, 2025, at VU Amsterdam. A weekend dedicated to empowering women in tech through collaboration, innovation, and competition.',
            stats: const [
              {'label': 'Expected', 'value': '100+'},
              {'label': 'Location', 'value': 'VU Amsterdam'},
              {'label': 'Date', 'value': 'June 13-15'},
            ],
            isLeft: true,
            onTap: () => _showEventDetails(
              context,
              '2025',
              'Hack4Her: 4th Annual Event',
              'Our upcoming 4th annual hackathon will focus on "Technology for Inclusion" - developing solutions that promote accessibility and inclusivity in digital spaces. The event will feature keynote speakers from leading tech companies, specialized workshops on emerging technologies, and dedicated mentorship for first-time hackathon participants.',
              'June 13-15, 2025',
              'VU Amsterdam Main Campus',
              isUpcoming: true,
            ),
          ),
          _TimelineEvent(
            year: '2024',
            title: 'Hack4Her: 3rd Annual Event',
            description:
                'Our 3rd annual event, focusing on creating a women-centered space in the tech world where participants collaborated on innovative projects and solutions.',
            stats: const [
              {'label': 'Participants', 'value': '200+'},
              {'label': 'Projects', 'value': '65+'},
              {'label': 'Sponsors', 'value': '20'},
            ],
            isLeft: false,
            onTap: () => _showEventDetails(
              context,
              '2024',
              'Hack4Her: 3rd Annual Event',
              'Our 3rd annual hackathon at VU Amsterdam brought together over 200 participants from across the Netherlands. The event featured workshops on AI, blockchain, and UX design, along with mentorship sessions and networking opportunities with industry professionals.',
              'June 7-9, 2024',
              'VU Amsterdam',
            ),
          ),
          _TimelineEvent(
            year: '2023',
            title: 'A Technology Retreat: A Hack4Her Event',
            description:
                'Our 2nd annual event, focusing on creating a women-centered space in the tech world where participants collaborated on innovative projects and solutions.',
            stats: const [
              {'label': 'Participants', 'value': '150+'},
              {'label': 'Projects', 'value': '50+'},
              {'label': 'Sponsors', 'value': '15'},
            ],
            isLeft: true,
            onTap: () => _showEventDetails(
              context,
              '2023',
              'A Technology Retreat: A Hack4Her Event',
              'In June 2023, Vrije Universiteit Amsterdam hosted "A Technology Retreat: A Hack4Her Event" at Booking.com offices. This unique event combined social activities, learning opportunities, and a women-only hackathon, focusing on empowering women in tech and promoting diversity. It offered workshops, lectures, and networking events, facilitating an inclusive space for innovation and collaboration.',
              'June 2023',
              'Booking.com offices',
            ),
          ),
          _TimelineEvent(
            year: '2022',
            title: 'Hack4Her: 1st Annual Event',
            description:
                'Our inaugural hackathon dedicated to empowering women in technology, creating a safe and inclusive environment for learning and innovation.',
            stats: const [
              {'label': 'Participants', 'value': '100+'},
              {'label': 'Projects', 'value': '30+'},
              {'label': 'Sponsors', 'value': '10'},
            ],
            isLeft: false,
            onTap: () => _showEventDetails(
              context,
              '2022',
              'Hack4Her 2022',
              'Hack4Her 2022 marked the inception of the first women-only hackathon, a pioneering initiative by STORM and VU. Designed to foster a secure and female-focused environment, this event enabled participants to hone their technical skills over two days filled with coding, networking, presentations, and complimentary meals. Held on the 16th floor of the NU building on the 3rd and 4th of June, it set a precedent for inclusivity and empowerment in tech.',
              'June 3-4, 2022',
              '16th floor of the NU building, VU',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGallery(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double imageHeight = screenWidth < AppTheme.mobileBreakpoint ? 150 : 250;

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

  void _showEventDetails(
    BuildContext context, 
    String year, 
    String title, 
    String description,
    String date,
    String location,
    {bool isUpcoming = false}
  ) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppTheme.textDark,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: isDark ? Colors.white70 : Colors.black54),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isUpcoming 
                      ? AppTheme.primaryBlue.withAlpha(50)
                      : AppTheme.primaryPurple.withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isUpcoming ? Icons.upcoming : Icons.event_available,
                      size: 16,
                      color: isUpcoming ? AppTheme.primaryBlue : AppTheme.primaryPurple,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isUpcoming ? "Upcoming Event" : year,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isUpcoming ? AppTheme.primaryBlue : AppTheme.primaryPurple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Event Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  _buildEventDetailItem(context, 'Date', date, Icons.calendar_today, isDark),
                  const SizedBox(width: 24),
                  _buildEventDetailItem(context, 'Location', location, Icons.location_on, isDark),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                isUpcoming ? 'What to Expect' : 'Highlights',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isUpcoming
                    ? '• Three days of intensive coding and innovation\n• Interactive workshops on cutting-edge technologies\n• Networking with industry professionals\n• Specialized tracks for beginners and advanced participants\n• Prizes worth over €10,000'
                    : year == '2023' 
                        ? '• Workshops and lectures by industry professionals\n• Networking events with tech leaders\n• Women-only hackathon focused on collaborative problem-solving\n• Social activities to promote community building'
                        : year == '2022'
                            ? '• Two days of intensive coding and learning\n• Technical skills development workshops\n• Networking with peers and mentors\n• Presentations of innovative projects\n• Complimentary meals throughout the event'
                            : '• Workshops on cutting-edge technologies\n• Mentorship from industry experts\n• Collaborative hackathon challenges\n• Networking opportunities with tech companies',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (isUpcoming) {
                      Navigator.pushNamed(context, AppRoutes.registration);
                    }
                  },
                  style: AppTheme.getPrimaryButtonStyle(context, isDark),
                  child: Text(
                    isUpcoming ? 'Register for the Event' : 'Close',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildEventDetailItem(BuildContext context, String label, String value, IconData icon, bool isDark) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon, 
                size: 16, 
                color: isDark ? Colors.white70 : Colors.grey[700],
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.white70 : Colors.grey[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppTheme.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineEvent extends StatelessWidget {
  final String year;
  final String title;
  final String description;
  final List<Map<String, String>> stats;
  final bool isLeft;
  final VoidCallback? onTap;

  const _TimelineEvent({
    required this.year,
    required this.title,
    required this.description,
    required this.stats,
    this.isLeft = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // On mobile, always use vertical layout
    if (screenWidth < AppTheme.mobileBreakpoint) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
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
                            (stat) => Flexible(
                              child: Column(
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
                                    overflow: TextOverflow.ellipsis,
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
            ],
          ),
        ),
      );
    }

    // Desktop layout with alternating sides
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                              (stat) => Flexible(
                                child: Container(
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
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
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
                              (stat) => Flexible(
                                child: Container(
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
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
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
                      Flexible(
                        child: Text(
                          team,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.emoji_events, size: 16, color: Colors.amber),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          award,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextButton.icon(
                    onPressed: () {
                      _showProjectDetails(context);
                    },
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
  
  void _showProjectDetails(BuildContext context) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppTheme.textDark,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: isDark ? Colors.white70 : Colors.black54),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryPurple.withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      year,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryPurple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Project Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  _buildDetailItem(context, 'Team', team, Icons.people, isDark),
                  const SizedBox(width: 24),
                  _buildDetailItem(context, 'Award', award, Icons.emoji_events, isDark),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Implementation Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'This project addressed key challenges in ${year == "2023" ? "health technology" : year == "2022" ? "education technology" : "safety and security"} '
                'through innovative use of ${year == "2023" ? "machine learning and data analytics" : year == "2022" ? "gamification and user experience design" : "crowdsourced data and real-time monitoring"}. '
                'The team employed a user-centered design approach, conducted extensive research, and utilized cutting-edge technologies to create a solution that can make a real difference.',
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: AppTheme.getPrimaryButtonStyle(context, isDark),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildDetailItem(BuildContext context, String label, String value, IconData icon, bool isDark) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon, 
                size: 16, 
                color: isDark ? Colors.white70 : Colors.grey[700],
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.white70 : Colors.grey[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppTheme.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
