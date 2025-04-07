import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/app_theme.dart';
import 'utils/routes.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/workshops_screen.dart';
import 'screens/challenges_screen.dart';
import 'screens/previous_events_screen.dart';

// Simple global theme controller that doesn't rely on shared_preferences
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  // Configure Flutter for web with path URL strategy (removes # from URLs)
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use ValueListenableBuilder to rebuild when theme changes
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Hack4Her',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getLightTheme(),
          darkTheme: AppTheme.getDarkTheme(),
          themeMode: currentMode,
          initialRoute: AppRoutes.home,
          onGenerateRoute: (settings) {
            // Add custom page transitions
            Widget page;
    
            switch (settings.name) {
              case AppRoutes.home:
                page = const HomeScreen();
                break;
              case AppRoutes.about:
                page = const AboutScreen();
                break;
              case AppRoutes.registration:
                page = const RegistrationScreen();
                break;
              case AppRoutes.workshops:
                page = const WorkshopsScreen();
                break;
              case AppRoutes.challenges:
                page = const ChallengesScreen();
                break;
              case AppRoutes.previousEvents:
                page = const PreviousEventsScreen();
                break;
              default:
                page = const HomeScreen();
            }
    
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (context, animation, secondaryAnimation) => page,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 0.1);
                const end = Offset.zero;
                const curve = Curves.easeInOut;
    
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);
    
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  ),
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
            );
          },
        );
      },
    );
  }
}
