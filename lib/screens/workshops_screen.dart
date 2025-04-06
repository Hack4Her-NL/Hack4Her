import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';
import '../widgets/page_layout.dart';
import '../widgets/section_container.dart';

class WorkshopsScreen extends StatelessWidget {
  const WorkshopsScreen({super.key});

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
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.registration);
                  },
                  style: AppTheme.primaryButtonStyle,
                  child: const Text(
                    'Register Now',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            decoration: AppTheme.gradientBackground,
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
                    color: Colors.white.withOpacity(0.2),
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
          ),
        ],
      ),
    );
  }

  Widget _buildWorkshopSchedule(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppTheme.mobileBreakpoint;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Day tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDayTab('Day 1', isSelected: true),
              _buildDayTab('Day 2'),
              _buildDayTab('Day 3'),
            ],
          ),
          const SizedBox(height: 30),
          // Workshops for the selected day
          const Column(
            children: [
              _WorkshopItem(
                title: 'Introduction to Flutter',
                presenter: 'Jane Doe',
                time: '10:00 AM - 11:30 AM',
                location: 'Room A',
                category: 'Technical',
              ),
              _WorkshopItem(
                title: 'UI/UX Design Principles',
                presenter: 'John Smith',
                time: '12:00 PM - 1:30 PM',
                location: 'Room B',
                category: 'Design',
              ),
              _WorkshopItem(
                title: 'Pitching Your Idea',
                presenter: 'Alice Johnson',
                time: '2:00 PM - 3:30 PM',
                location: 'Room C',
                category: 'Business',
              ),
              _WorkshopItem(
                title: 'Team Collaboration',
                presenter: 'Bob Williams',
                time: '4:00 PM - 5:30 PM',
                location: 'Room A',
                category: 'Soft Skills',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayTab(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          foregroundColor: isSelected ? AppTheme.primaryPurple : Colors.white,
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

    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: AppTheme.primaryPurple,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '$workshopCount Workshops',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
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
}

class _WorkshopItem extends StatelessWidget {
  final String title;
  final String presenter;
  final String time;
  final String location;
  final String category;

  const _WorkshopItem({
    required this.title,
    required this.presenter,
    required this.time,
    required this.location,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
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
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.person, color: Colors.white, size: 16),
              const SizedBox(width: 5),
              Text(
                presenter,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.white, size: 16),
              const SizedBox(width: 5),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 16),
              const SizedBox(width: 5),
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
    );
  }
}
