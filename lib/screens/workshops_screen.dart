import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';
import '../widgets/page_layout.dart';
import '../widgets/section_container.dart';
import '../main.dart'; // Import for themeNotifier

class WorkshopsScreen extends StatefulWidget {
  const WorkshopsScreen({super.key});

  @override
  State<WorkshopsScreen> createState() => _WorkshopsScreenState();
}

class _WorkshopsScreenState extends State<WorkshopsScreen> {
  int _selectedDayIndex = 0;
  
  // Workshop data for each day
  final List<List<Map<String, String>>> _workshopsByDay = [
    // Day 1 workshops
    [
      {
        'title': 'Introduction to Flutter',
        'presenter': 'Jane Doe',
        'time': '10:00 AM - 11:30 AM',
        'location': 'Room A',
        'category': 'Technical',
        'description': 'Learn the basics of Flutter and how to build cross-platform mobile apps with a single codebase.'
      },
      {
        'title': 'UI/UX Design Principles',
        'presenter': 'John Smith',
        'time': '12:00 PM - 1:30 PM',
        'location': 'Room B',
        'category': 'Design',
        'description': 'Discover core principles of effective UI/UX design and how to create intuitive user experiences.'
      },
      {
        'title': 'Pitching Your Idea',
        'presenter': 'Alice Johnson',
        'time': '2:00 PM - 3:30 PM',
        'location': 'Room C',
        'category': 'Business',
        'description': 'Learn how to effectively communicate your ideas and pitch your projects to potential investors or partners.'
      },
      {
        'title': 'Team Collaboration',
        'presenter': 'Bob Williams',
        'time': '4:00 PM - 5:30 PM',
        'location': 'Room A',
        'category': 'Soft Skills',
        'description': 'Develop effective team collaboration skills essential for hackathons and professional environments.'
      },
    ],
    // Day 2 workshops
    [
      {
        'title': 'Advanced Flutter State Management',
        'presenter': 'Emily Chen',
        'time': '9:30 AM - 11:00 AM',
        'location': 'Room A',
        'category': 'Technical',
        'description': 'Deep dive into state management solutions for Flutter applications, including Provider, Riverpod, and Bloc.'
      },
      {
        'title': 'Data Visualization',
        'presenter': 'Michael Brown',
        'time': '11:30 AM - 1:00 PM',
        'location': 'Room B',
        'category': 'Technical',
        'description': 'Learn how to create effective and beautiful data visualizations for your applications.'
      },
      {
        'title': 'Accessible Design',
        'presenter': 'Sarah Lee',
        'time': '2:00 PM - 3:30 PM',
        'location': 'Room C',
        'category': 'Design',
        'description': 'Learn how to make your applications accessible to all users, including those with disabilities.'
      },
      {
        'title': 'Project Management',
        'presenter': 'David Wilson',
        'time': '4:00 PM - 5:30 PM',
        'location': 'Room D',
        'category': 'Business',
        'description': 'Develop project management skills to keep your team organized and on track during the hackathon.'
      },
    ],
    // Day 3 workshops
    [
      {
        'title': 'Machine Learning Basics',
        'presenter': 'Rachel Green',
        'time': '9:30 AM - 11:00 AM',
        'location': 'Room A',
        'category': 'Technical',
        'description': 'Introduction to machine learning concepts and how to integrate ML models into your applications.'
      },
      {
        'title': 'Cloud Deployment',
        'presenter': 'Thomas Anderson',
        'time': '11:30 AM - 1:00 PM',
        'location': 'Room B',
        'category': 'Technical',
        'description': 'Learn how to deploy your applications to the cloud using services like Firebase, AWS, or Azure.'
      },
      {
        'title': 'Presentation Skills',
        'presenter': 'Jessica Parker',
        'time': '2:00 PM - 3:30 PM',
        'location': 'Room C',
        'category': 'Soft Skills',
        'description': 'Develop skills to effectively present your project to judges and audiences.'
      },
      {
        'title': 'Final Project Clinic',
        'presenter': 'Hack4Her Team',
        'time': '4:00 PM - 6:00 PM',
        'location': 'All Rooms',
        'category': 'Support',
        'description': 'Get last-minute help and feedback on your projects before the final submissions.'
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppRoutes.workshops,
      showGradientHeader: true,
      headerTitle: 'Workshops',
      headerContent: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          'Expand your skills with our interactive workshops',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      child: Column(
        children: [
          // Workshop overview
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Join our expert-led workshops to learn new skills and technologies. All workshops are included with your registration.',
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

          // Workshop schedule
          SectionContainer(
            title: 'Workshop Schedule',
            useGradientBackground: true,
            child: _buildWorkshopSchedule(context),
          ),

          // Workshop categories
          SectionContainer(
            title: 'Workshop Categories',
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _buildCategoryCard('Technical', Icons.code, context),
                _buildCategoryCard('Design', Icons.brush, context),
                _buildCategoryCard('Business', Icons.business, context),
                _buildCategoryCard('Soft Skills', Icons.people, context),
              ],
            ),
          ),

          // Workshop registration
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, themeMode, _) {
              final isDark = themeMode == ThemeMode.dark;
              
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                decoration: isDark
                    ? AppTheme.darkGradientBackground
                    : AppTheme.gradientBackground,
                child: Column(
                  children: [
                    const Text(
                      'How to Register for Workshops',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withAlpha(30) // Darker background in dark mode
                            : Colors.white.withAlpha(51), // Original alpha for light mode
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Workshop Registration Process:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _buildStep(
                            '1',
                            'Register for Hack4Her',
                            'You must be a registered participant to attend workshops.',
                          ),
                          _buildStep(
                            '2',
                            'Browse Available Workshops',
                            'Check out the workshop schedule and select the ones you\'re interested in.',
                          ),
                          _buildStep(
                            '3',
                            'Sign Up for Workshops',
                            'Use our workshop registration system to secure your spot.',
                          ),
                          _buildStep(
                            '4',
                            'Receive Confirmation',
                            'You\'ll receive a confirmation email with workshop details.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWorkshopSchedule(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Day tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDayTab('Day 1', isSelected: _selectedDayIndex == 0, onTap: () => _selectDay(0)),
              _buildDayTab('Day 2', isSelected: _selectedDayIndex == 1, onTap: () => _selectDay(1)),
              _buildDayTab('Day 3', isSelected: _selectedDayIndex == 2, onTap: () => _selectDay(2)),
            ],
          ),
          const SizedBox(height: 30),
          // Workshops for the selected day
          Column(
            children: _workshopsByDay[_selectedDayIndex].map((workshop) {
              return _WorkshopItem(
                title: workshop['title']!,
                presenter: workshop['presenter']!,
                time: workshop['time']!,
                location: workshop['location']!,
                category: workshop['category']!,
                description: workshop['description']!,
                onTap: () => _showWorkshopDetails(context, workshop),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDayTab(String text, {bool isSelected = false, VoidCallback? onTap}) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected 
                  ? Colors.white 
                  : Colors.white.withAlpha(51), // 0.2 * 255 = 51
              foregroundColor: isSelected 
                  ? (isDark ? AppTheme.darkPurple : AppTheme.primaryPurple)
                  : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, BuildContext context) {
    String workshopCount;

    if (title == 'Technical') {
      workshopCount = '8';
    } else if (title == 'Design') {
      workshopCount = '6';
    } else if (title == 'Business') {
      workshopCount = '5';
    } else {
      workshopCount = '4';
    }

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: isDark
                ? AppTheme.darkSurface.withAlpha(128) // Semi-transparent in dark mode
                : Colors.grey.withAlpha(26), // 0.1 * 255 = 25.5
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: isDark
                    ? Colors.grey.withAlpha(77) // 0.3 * 255 = 76.5
                    : Colors.grey.withAlpha(77)
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: isDark
                    ? AppTheme.primaryPurple
                    : AppTheme.primaryBlue,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$workshopCount Workshops',
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.grey[400] : Colors.grey[700],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStep(String number, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: AppTheme.primaryPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
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

  void _selectDay(int index) {
    setState(() {
      _selectedDayIndex = index;
    });
  }

  void _showWorkshopDetails(BuildContext context, Map<String, String> workshop) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 500),
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
                      workshop['title']!,
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
                  color: isDark ? AppTheme.primaryPurple.withAlpha(50) : AppTheme.primaryBlue.withAlpha(50),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  workshop['category']!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppTheme.primaryPurple : AppTheme.primaryBlue,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow(Icons.person, 'Presenter', workshop['presenter']!, isDark),
              _buildDetailRow(Icons.access_time, 'Time', workshop['time']!, isDark),
              _buildDetailRow(Icons.location_on, 'Location', workshop['location']!, isDark),
              const SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppTheme.textDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                workshop['description']!,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.pop(context);
                    // Navigate to registration screen
                    Navigator.pushNamed(context, AppRoutes.registration);
                  },
                  style: AppTheme.getPrimaryButtonStyle(context, isDark),
                  child: const Text(
                    'Register for this Workshop',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: isDark ? Colors.white70 : Colors.black54,
          ),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppTheme.textDark,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkshopItem extends StatelessWidget {
  final String title;
  final String presenter;
  final String time;
  final String location;
  final String category;
  final String description;
  final VoidCallback onTap;

  const _WorkshopItem({
    required this.title,
    required this.presenter,
    required this.time,
    required this.location,
    required this.category,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark
                ? AppTheme.darkSurface.withAlpha(128)
                : Colors.white.withAlpha(51), // 0.2 * 255 = 51
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            splashColor: Colors.white.withAlpha(30),
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(77), // 0.3 * 255 = 76.5
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Presenter: $presenter',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
