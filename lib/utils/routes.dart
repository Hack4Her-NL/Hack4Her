import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/workshops_screen.dart';
import '../screens/challenges_screen.dart';
import '../screens/previous_events_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String registration = '/registration';
  static const String workshops = '/workshops';
  static const String challenges = '/challenges';
  static const String previousEvents = '/previous-events';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    about: (context) => const AboutScreen(),
    registration: (context) => const RegistrationScreen(),
    workshops: (context) => const WorkshopsScreen(),
    challenges: (context) => const ChallengesScreen(),
    previousEvents: (context) => const PreviousEventsScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // For handling dynamic routes with parameters later
    return MaterialPageRoute(
      settings: settings,
      builder: routes[settings.name] ?? (context) => const HomeScreen(),
    );
  }

  static List<Map<String, String>> navigationItems = [
    {'title': 'Home', 'route': home},
    {'title': 'About Us', 'route': about},
    {'title': 'Registration', 'route': registration},
    {'title': 'Workshops', 'route': workshops},
    {'title': 'Challenges', 'route': challenges},
    {'title': 'Previous Events', 'route': previousEvents},
  ];
}
