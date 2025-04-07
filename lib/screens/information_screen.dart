import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';
import '../widgets/page_layout.dart';
import '../widgets/section_container.dart';
import '../main.dart'; // Import for themeNotifier

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      currentRoute: AppRoutes.information,
      showGradientHeader: true,
      headerTitle: 'Information',
      headerContent: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          'Everything you need to know about Hack4Her',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      child: Column(
        children: [
          // Information section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Hack4Her is the only female-focused student hackathon in the Netherlands',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Creating a space where technology and diversity meet. We are a coalition of staff and students from the Vrije Universiteit Amsterdam and Universiteit van Amsterdam. Our mission is simple: to create a women-centered space in the tech world.',
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Event Details section
          SectionContainer(
            title: 'Event Details',
            useGradientBackground: true,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Our 4th Annual Hack4Her event is taking place on June 13-15, 2025, at VU Amsterdam. This weekend is dedicated to empowering women in tech through collaboration, innovation, and competition.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Event Highlights:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      _BulletPoint('Open to all students in the Netherlands'),
                      _BulletPoint('Coding, workshops, lectures, and networking opportunities'),
                      _BulletPoint('While all genders are welcome, only women are eligible to compete in the hackathon'),
                      _BulletPoint('Free food and drinks provided'),
                      _BulletPoint('Chance for free accommodation'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Schedule Section
          SectionContainer(
            title: 'Event Schedule',
            useGradientBackground: true,
            child: _buildScheduleTabs(),
          ),

          // Eligibility section
          SectionContainer(
            title: 'Eligibility',
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'All participants must adhere to our code of conduct throughout the event.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Code of Conduct Summary:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      _BulletPoint('We are committed to providing a safe and inclusive environment for all participants'),
                      _BulletPoint('Harassment or discrimination of any kind will not be tolerated'),
                      _BulletPoint('Respect the opinions, skills, and boundaries of other participants'),
                      _BulletPoint('Follow the event rules and guidelines at all times'),
                      _BulletPoint('Report any concerns or violations to the event organizers immediately'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    _launchURL('https://hack4her.github.io/');
                  },
                  child: const Text('Read Full Code of Conduct'),
                ),
              ],
            ),
          ),

          // FAQ Section
          const SectionContainer(
            title: 'Frequently Asked Questions',
            useGradientBackground: true,
            child: Column(
              children: [
                _FaqItem(
                  question: 'What is Hack4Her?',
                  answer:
                      'Hack4Her is the only female-focused student hackathon in the Netherlands, creating a space where technology and diversity meet. We aim to empower women in tech through collaboration, innovation, and competition.',
                ),
                _FaqItem(
                  question: 'Who can participate?',
                  answer:
                      'All students in the Netherlands are welcome to attend. While all genders are welcome to participate in the event, only women are eligible to compete in the hackathon portion.',
                ),
                _FaqItem(
                  question: 'Do I need to know how to code?',
                  answer:
                      'No, you don\'t need prior coding experience. Hack4Her is designed to be inclusive and educational. We have workshops and mentors to help you learn and develop your skills.',
                ),
                _FaqItem(
                  question: 'What should I bring?',
                  answer:
                      'Bring your laptop, charger, any personal items you may need, and most importantly, your enthusiasm and creativity!',
                ),
              ],
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

  Widget _buildScheduleTabs() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppTheme.primaryPurple,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(text: 'Friday'),
                Tab(text: 'Saturday'),
                Tab(text: 'Sunday'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 400, // Set a fixed height for the tab content
            child: TabBarView(
              children: [
                _buildDaySchedule(_fridaySchedule),
                _buildDaySchedule(_saturdaySchedule),
                _buildDaySchedule(_sundaySchedule),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySchedule(List<Map<String, String>> schedule) {
    final ScrollController scrollController = ScrollController();
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Scrollbar(
        controller: scrollController,
        thickness: 6,
        radius: const Radius.circular(3),
        thumbVisibility: true,
        child: ListView.builder(
          controller: scrollController,
          itemCount: schedule.length,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) {
            final item = schedule[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Time column
                    Container(
                      width: 100,
                      child: Text(
                        item['time']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Activity column with location
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['activity']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          if (item['location'] != null && item['location']!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                '(${item['location']})',
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Schedule data
  static const List<Map<String, String>> _fridaySchedule = [
    {'time': '11:30 - 12:00', 'activity': 'Participants Arrive', 'location': ''},
    {'time': '12:00 - 13:00', 'activity': 'Introduction', 'location': ''},
    {'time': '13:00 - 14:00', 'activity': 'Lunch', 'location': 'Booking.com grads and mentors join to chat with students over lunch!'},
    {'time': '14:00 - 15:00', 'activity': 'Keynote', 'location': ''},
    {'time': '15:00 - 16:30', 'activity': 'Workshops Round 1', 'location': ''},
    {'time': '16:30 - 17:00', 'activity': 'Break and Light Snacks', 'location': ''},
    {'time': '17:00 - 18:30', 'activity': 'Workshops Round 2', 'location': ''},
    {'time': '18:30 - 21:00', 'activity': 'Dinner/drinks and networking', 'location': ''},
    {'time': '21:00', 'activity': 'Participants Leave', 'location': ''},
  ];

  static const List<Map<String, String>> _saturdaySchedule = [
    {'time': '9:00 - 9:30', 'activity': 'Participants Arrive', 'location': 'Event Spot'},
    {'time': '9:30 - 10:00', 'activity': 'Breakfast', 'location': 'Event Spot'},
    {'time': '10:00 - 10:15', 'activity': 'Introduction', 'location': 'Theatre 1'},
    {'time': '10:15 - 11:00', 'activity': 'Challenge Workshops', 'location': '2B01, 2B05, 2B12, 2B17, 2B25'},
    {'time': '11:00 - 14:00', 'activity': 'Hacking', 'location': '2B01, 2B05, 2B12, 2B17, 2B25'},
    {'time': '14:00 - 15:00', 'activity': 'Lunch', 'location': 'Event Spot'},
    {'time': '15:00 - 19:00', 'activity': 'Hacking', 'location': '2B01, 2B05, 2B12, 2B17, 2B25'},
    {'time': '19:00 - 20:00', 'activity': 'Dinner', 'location': 'Event Spot'},
    {'time': '20:00 - 22:00', 'activity': 'Hacking', 'location': '2B01, 2B05, 2B12, 2B17, 2B25'},
  ];

  static const List<Map<String, String>> _sundaySchedule = [
    {'time': '9:00 - 9:30', 'activity': 'Participants Arrive', 'location': 'Event Spot'},
    {'time': '9:30 - 10:00', 'activity': 'Breakfast', 'location': 'Event Spot'},
    {'time': '10:00 - 10:05', 'activity': 'Introduction', 'location': 'Theatre 1'},
    {'time': '10:05 - 14:00', 'activity': 'Hacking', 'location': '2B01, 2B05, 2B12, 2B17, 2B25'},
    {'time': '14:00 - 15:00', 'activity': 'Lunch', 'location': 'Event Spot'},
    {'time': '15:00 - 16:00', 'activity': 'Hacking (Last Hour)', 'location': '2B01, 2B05, 2B12, 2B17, 2B25'},
    {'time': '16:00 - 18:00', 'activity': 'Judging/Presenting', 'location': '4A06, 4A25'},
    {'time': '18:00 - 18:30', 'activity': 'Deliberation', 'location': '4A06, 4A25'},
    {'time': '18:30 - 19:30', 'activity': 'Closing and Presentation of Awards', 'location': 'Theatre 1'},
  ];
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint(this.text);

  @override
  Widget build(BuildContext context) {
    // Determine if this bullet point is inside a gradient section by checking its parent
    final bool isInGradientSection = context.findAncestorWidgetOfExactType<SectionContainer>()?.useGradientBackground ?? false;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isInGradientSection ? Colors.white : Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: isInGradientSection ? Colors.white : Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
} 