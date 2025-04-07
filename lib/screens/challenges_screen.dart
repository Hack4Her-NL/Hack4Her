import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';
import '../widgets/page_layout.dart';
import '../widgets/section_container.dart';
import '../main.dart'; // Import for themeNotifier

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppRoutes.challenges,
      showGradientHeader: true,
      headerTitle: 'Challenges',
      headerContent: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          'Explore the exciting challenges for this year\'s hackathon',
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
                  'Our challenges are designed to inspire innovation and creativity. Choose one or create your own project that aligns with our theme.',
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
                        'Register Now',
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

          // Main Challenge
          SectionContainer(
            title: 'Main Challenge',
            useGradientBackground: true,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Empowering Women in Technology',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Create an innovative solution that addresses challenges faced by women in technology or empowers women through technology.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildChip('Grand Prize', Colors.amber),
                      const SizedBox(width: 10),
                      _buildChip('All Teams', Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Sponsored Challenges
          const SectionContainer(
            title: 'Sponsored Challenges',
            child: Column(
              children: [
                _ChallengeCard(
                  title: 'AI for Good',
                  description:
                      'Develop an AI-powered solution that addresses a social issue affecting women or underrepresented groups.',
                  sponsor: 'TechCorp',
                  prize: '\$2,000',
                  tags: ['AI/ML', 'Social Impact'],
                ),
                _ChallengeCard(
                  title: 'Health & Wellness',
                  description:
                      'Create an application that promotes women\'s health and wellness through technology.',
                  sponsor: 'HealthTech',
                  prize: '\$1,500',
                  tags: ['Healthcare', 'Mobile'],
                ),
                _ChallengeCard(
                  title: 'Educational Technology',
                  description:
                      'Build a tool that enhances STEM education for young women and girls.',
                  sponsor: 'EduSolutions',
                  prize: '\$1,500',
                  tags: ['Education', 'Web App'],
                ),
                _ChallengeCard(
                  title: 'Sustainable Future',
                  description:
                      'Design a solution that addresses environmental challenges while promoting diversity in green tech.',
                  sponsor: 'GreenFuture',
                  prize: '\$1,000',
                  tags: ['Sustainability', 'IoT'],
                ),
              ],
            ),
          ),

          // Judging Criteria
          SectionContainer(
            title: 'Judging Criteria',
            useGradientBackground: true,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildCriterionItem(
                    'Innovation',
                    'Originality and creativity of the solution',
                    '25%',
                  ),
                  _buildCriterionItem(
                    'Impact',
                    'Potential to create meaningful change',
                    '25%',
                  ),
                  _buildCriterionItem(
                    'Technical Implementation',
                    'Quality and complexity of technical work',
                    '20%',
                  ),
                  _buildCriterionItem(
                    'Design',
                    'User experience and interface design',
                    '15%',
                  ),
                  _buildCriterionItem(
                    'Presentation',
                    'Quality of demo and pitch',
                    '15%',
                  ),
                ],
              ),
            ),
          ),

          // Prizes Section
          SectionContainer(
            title: 'Prizes',
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _buildPrizeCard(
                  'Grand Prize',
                  '\$5,000',
                  'For the overall winner of Hack4Her',
                  Icons.emoji_events,
                  Colors.amber,
                ),
                _buildPrizeCard(
                  'Runner Up',
                  '\$2,500',
                  'For the second place team',
                  Icons.workspace_premium,
                  Colors.grey.shade400,
                ),
                _buildPrizeCard(
                  'People\'s Choice',
                  '\$1,000',
                  'Voted by all participants',
                  Icons.favorite,
                  Colors.redAccent,
                ),
                _buildPrizeCard(
                  'Best Freshman Project',
                  '\$1,000',
                  'For first-time hackathon participants',
                  Icons.star,
                  Colors.deepPurpleAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildCriterionItem(String title, String description, String percentage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                percentage,
                style: const TextStyle(
                  color: AppTheme.primaryPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
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
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrizeCard(
      String title, String prize, String description, IconData icon, Color color) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 50,
            color: color,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            prize,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryPurple,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  final String title;
  final String description;
  final String sponsor;
  final String prize;
  final List<String> tags;

  const _ChallengeCard({
    required this.title,
    required this.description,
    required this.sponsor,
    required this.prize,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  prize,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.business, size: 16, color: Colors.grey[700]),
              const SizedBox(width: 5),
              Text(
                'Sponsored by $sponsor',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
