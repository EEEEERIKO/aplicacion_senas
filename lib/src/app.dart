import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'ui/widgets/main_shell.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ui/screens/onboarding_screen.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/learn_screen.dart';
import 'ui/screens/translate_screen.dart';
import 'ui/screens/pro_screen.dart';
import 'ui/screens/ranking_screen.dart';
import 'ui/screens/profile_screen.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/register_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
        GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
        GoRoute(path: '/register', builder: (context, state) => const RegisterScreen()),
        ShellRoute(
          builder: (context, state, child) {
            // Main shell provides the persistent bottom navigation
            return MainShell(child: child, currentLocation: state.location);
          },
          routes: [
            GoRoute(path: '/home', builder: (context, state) => const LearnScreen()),
            GoRoute(path: '/translate', builder: (context, state) => const TranslateScreen()),
            GoRoute(path: '/pro', builder: (context, state) => const ProScreen()),
            GoRoute(path: '/ranking', builder: (context, state) => const RankingScreen()),
            GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen()),
          ],
        ),
      ],
    );

    return MaterialApp.router(
  title: 'Signoise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: router,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) return supportedLocales.first;
        for (var supported in supportedLocales) {
          if (supported.languageCode == locale.languageCode) return supported;
        }
        return supportedLocales.first;
      },
    );
  }
}
