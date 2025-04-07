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

          // Challenges (formerly Sponsored Challenges)
          SectionContainer(
            title: 'Challenges',
            useGradientBackground: true,
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
                _ChallengeCard(
                  title: 'Women in Tech Empowerment',
                  description:
                      'Create an innovative solution that addresses challenges faced by women in technology or empowers women through technology.',
                  sponsor: 'Hack4Her',
                  prize: '\$3,000',
                  tags: ['Grand Prize', 'All Teams'],
                ),
              ],
            ),
          ),

          // Judging Criteria
          SectionContainer(
            title: 'Judging Criteria',
            useGradientBackground: true,
            child: ValueListenableBuilder<ThemeMode>(
              valueListenable: themeNotifier,
              builder: (context, themeMode, _) {
                final isDark = themeMode == ThemeMode.dark;
                
                return Container(
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
                );
              },
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
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withOpacity(0.9) : Colors.white,
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
      },
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

class _ChallengeCard extends StatefulWidget {
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
  State<_ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<_ChallengeCard> {
  bool _isExpanded = false;

  // Additional challenge information (would normally come from a backend)
  final Map<String, String> _extraInfo = {
    'AI for Good': 'This challenge focuses on creating AI solutions that address social issues affecting women or underrepresented groups. Participants are encouraged to consider ethical implications of AI and develop responsible AI systems that promote inclusivity and fairness.',
    'Health & Wellness': 'Create innovative solutions that address women\'s health concerns, improve wellness monitoring, or provide accessible health information. Consider issues like maternal health, mental wellness, or fitness tracking specifically designed for women\'s needs.',
    'Educational Technology': 'This challenge seeks innovative approaches to make STEM education more engaging and accessible to young women and girls. Solutions might include interactive learning platforms, gamified educational experiences, or tools that connect students with female role models in STEM.',
    'Sustainable Future': 'Develop technology solutions that address environmental challenges while promoting diversity in green tech. Consider issues like climate change, renewable energy, sustainable consumption, or conservation efforts.',
    'Women in Tech Empowerment': 'This is our grand prize challenge! Create solutions that directly address barriers faced by women in technology or use technology to empower women globally. Examples might include mentorship platforms, bias detection tools, or career advancement resources.',
  };

  // Sample requirements based on the challenge
  final Map<String, List<String>> _requirements = {
    'AI for Good': [
      'Must use machine learning or AI components',
      'Should address a clear social issue affecting women',
      'Must include documentation on ethical considerations',
      'Should be accessible to diverse user groups'
    ],
    'Health & Wellness': [
      'Must focus on specific health needs of women',
      'Should have an intuitive user interface',
      'Must protect sensitive health information',
      'Should be evidence-based where possible'
    ],
    'Educational Technology': [
      'Must target K-12 or university-level education',
      'Should incorporate STEM educational principles',
      'Must be engaging and interactive',
      'Should track learning outcomes'
    ],
    'Sustainable Future': [
      'Must address a specific environmental challenge',
      'Should incorporate data collection or analysis',
      'Must have a clear sustainability impact',
      'Should promote inclusion in environmental tech'
    ],
    'Women in Tech Empowerment': [
      'Must directly address challenges women face in tech',
      'Should be scalable to reach many women',
      'Must demonstrate measurable impact',
      'Should incorporate feedback from target users'
    ],
  };

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkSurface : Colors.white,
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
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryPurple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.prize,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          _isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: isDark ? Colors.white70 : Colors.grey[700],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white70 : Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.business, 
                      size: 16, 
                      color: isDark ? Colors.white70 : Colors.grey[700],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Sponsored by ${widget.sponsor}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white70 : Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: isDark 
                            ? AppTheme.primaryPurple.withOpacity(0.2)
                            : AppTheme.primaryBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppTheme.primaryBlue,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                // Expanded content
                if (_isExpanded) ...[
                  const SizedBox(height: 20),
                  Divider(color: isDark ? Colors.white30 : Colors.grey[300]),
                  const SizedBox(height: 10),
                  Text(
                    'Challenge Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _extraInfo[widget.title] ?? 'Additional information coming soon.',
                    style: TextStyle(
                      fontSize: 15,
                      color: isDark ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Requirements',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (_requirements[widget.title] ?? ['Requirements coming soon'])
                        .map((req) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check_circle, 
                                size: 16, 
                                color: isDark ? AppTheme.primaryPurple.withOpacity(0.8) : AppTheme.primaryPurple,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  req,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isDark ? Colors.white70 : Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                        .toList(),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.registration);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Apply to this Challenge',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
