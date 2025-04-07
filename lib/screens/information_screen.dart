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
                    'Our 3rd Annual Hack4Her event is taking place on June 7-9, 2024, at VU Amsterdam. This weekend is dedicated to empowering women in tech through collaboration, innovation, and competition.',
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

          // Code of conduct section
          SectionContainer(
            title: 'Code of Conduct',
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