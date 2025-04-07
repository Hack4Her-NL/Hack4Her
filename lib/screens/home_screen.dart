import 'package:flutter/material.dart';
import '../constants/app_theme.dart';
import '../utils/routes.dart';
import '../widgets/page_layout.dart';
import '../widgets/section_container.dart';
import '../main.dart'; // Import for themeNotifier

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return PageLayout(
      currentRoute: AppRoutes.home,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero section
          _buildHeroSection(screenSize, context),

          // About event section
          SectionContainer(
            title: 'About Hack4Her',
            child: Column(
              children: [
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.about);
                  },
                  style: AppTheme.primaryButtonStyle,
                  child: const Text('Learn More'),
                ),
              ],
            ),
          ),

          // Event highlights
          SectionContainer(
            title: 'Event Highlights',
            useGradientBackground: true,
            child: _buildEventHighlights(),
          ),

          // Past Events Images
          SectionContainer(
            title: 'Images from Past Events',
            child: _buildPastEventsGallery(screenSize),
          ),

          // Sponsors section
          SectionContainer(
            title: 'Our Sponsors',
            child: _buildSponsorsGrid(screenSize),
          ),

          // CTA section
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
                      'Ready to Join Hack4Her?',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Register now and be part of this amazing experience',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.registration);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppTheme.primaryPurple,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
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
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(Size screenSize, BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        final isDark = themeMode == ThemeMode.dark;
        
        return Container(
          width: double.infinity,
          height: screenSize.height * 0.7,
          decoration: isDark 
              ? AppTheme.darkGradientBackground 
              : AppTheme.gradientBackground,
          child: Stack(
            children: [
              // Female symbol overlay
              Positioned(
                right: screenSize.width * 0.05,
                top: screenSize.height * 0.1,
                child: Opacity(
                  opacity: 0.2,
                  child: Icon(
                    Icons.female,
                    size: screenSize.width * 0.25,
                    color: Colors.white,
                  ),
                ),
              ),
              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hack4Her',
                      style: TextStyle(
                        fontSize: AppTheme.responsiveFontSize(86, context),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'A hackathon dedicated to empowering women in technology',
                        style: TextStyle(
                          fontSize: AppTheme.responsiveFontSize(22, context),
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.registration);
                      },
                      style: AppTheme.secondaryButtonStyle,
                      child: Text(
                        'Learn More',
                        style: TextStyle(
                          fontSize: AppTheme.responsiveFontSize(22, context),
                          fontWeight: FontWeight.w500,
                        ),
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

  Widget _buildEventHighlights() {
    return const Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        _HighlightCard(
          icon: Icons.people,
          title: 'Networking',
          description: 'Connect with like-minded individuals and industry professionals',
        ),
        _HighlightCard(
          icon: Icons.lightbulb,
          title: 'Innovation',
          description: 'Develop creative solutions to real-world challenges',
        ),
        _HighlightCard(
          icon: Icons.school,
          title: 'Learning',
          description: 'Attend workshops and gain valuable skills',
        ),
        _HighlightCard(
          icon: Icons.emoji_events,
          title: 'Prizes',
          description: 'Win amazing prizes and recognition for your work',
        ),
      ],
    );
  }

  Widget _buildPastEventsGallery(Size screenSize) {
    final bool isMobile = screenSize.width < AppTheme.mobileBreakpoint;
    final double imageHeight = isMobile ? 150 : 200;

    // List of face images to use
    final List<String> faceImages = [
      'assets/images/face0.png',
      'assets/images/face1.jpg',
      'assets/images/face2.jpg',
      'assets/images/face3.jpg',
      'assets/images/face4.jpg',
    ];

    return SizedBox(
      height: imageHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: faceImages.length,
        itemBuilder: (context, index) {
          return Container(
            width: imageHeight * 1.5,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(faceImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSponsorsGrid(Size screenSize) {
    final bool isMobile = screenSize.width < AppTheme.mobileBreakpoint;
    final int crossAxisCount = isMobile ? 2 : 4;

    // List of company images to use (use them multiple times since we have 8 slots)
    final List<String> companyImages = [
      'assets/images/company0.png',
      'assets/images/company1.png',
      'assets/images/company2.png',
      'assets/images/company3.png',
      'assets/images/company0.png',
      'assets/images/company1.png',
      'assets/images/company2.png',
      'assets/images/company3.png',
    ];

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: List.generate(
        companyImages.length,
        (index) => Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            image: DecorationImage(
              image: AssetImage(companyImages[index]),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _HighlightCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.white,
          ),
          const SizedBox(height: 15),
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
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
