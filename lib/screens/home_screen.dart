import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/info_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Create a key for the content section
    final contentKey = GlobalKey();
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hack4Her'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: screenSize.height * 0.7, // 70% of screen height
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF8A54E1), // Purple
                    Color(0xFF4485EB), // Blue
                  ],
                ),
              ),
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
                        size: screenSize.width * 0.25, // Responsive size
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
                            fontSize: screenSize.width > 600 ? 86 : 48, // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.05),
                        ElevatedButton(
                          onPressed: () {
                            // Scroll to the content section using the key
                            Scrollable.ensureVisible(
                              contentKey.currentContext!,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width > 600 ? 40 : 20,
                              vertical: screenSize.width > 600 ? 15 : 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Learn More',
                            style: TextStyle(
                              fontSize: screenSize.width > 600 ? 22 : 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              key: contentKey, // Add the key here
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  InfoCard(
                    title: 'Flutter Documentation',
                    description:
                        'Learn more about Flutter framework and how to build amazing apps.',
                    icon: Icons.book,
                    onTap: () => _launchUrl('https://flutter.dev/docs'),
                  ),
                  InfoCard(
                    title: 'Cloudflare Pages',
                    description: 'Deploy and host your web apps on Cloudflare\'s global network.',
                    icon: Icons.cloud,
                    onTap: () => _launchUrl('https://pages.cloudflare.com/'),
                  ),
                  InfoCard(
                    title: 'Flutter for Web',
                    description: 'Build high-performance web experiences using Flutter.',
                    icon: Icons.web,
                    onTap: () => _launchUrl('https://flutter.dev/multi-platform/web'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
