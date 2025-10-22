import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'ui/screens/onboarding_screen.dart';
import 'ui/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      ],
    );

    return MaterialApp.router(
      title: 'Aplicación Señas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
