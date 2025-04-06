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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hack4Her'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Welcome to Hack4Her',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            InfoCard(
              title: 'Flutter Documentation',
              description: 'Learn more about Flutter framework and how to build amazing apps.',
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
    );
  }
} 