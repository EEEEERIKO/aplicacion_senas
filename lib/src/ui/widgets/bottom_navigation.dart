import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavigation extends StatelessWidget {
  final String currentRoute;
  final bool floating;
  const AppBottomNavigation({super.key, required this.currentRoute, this.floating = false});

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/translate');
        break;
      case 2:
        context.go('/pro');
        break;
      case 3:
        context.go('/ranking');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  int _indexForRoute(String route) {
    if (route.startsWith('/translate')) return 1;
    if (route.startsWith('/pro')) return 2;
    if (route.startsWith('/ranking')) return 3;
    if (route.startsWith('/profile')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final activeIndex = _indexForRoute(currentRoute);

    // Design tokens inspired by the provided HTML
    const activeGradientStart = Color(0xFFA3BFFA);
    const activeGradientEnd = Color(0xFF6B8AFA);
  const inactiveIcon = Color(0xFF5A67D8);

    Widget item(IconData icon, String label, bool active, int index) {
      return Expanded(
        child: InkWell(
          onTap: () => _onTap(context, index),
          borderRadius: BorderRadius.circular(999),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 4),
              Container(
                padding: EdgeInsets.all(active ? 14 : 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  gradient: active
                      ? const LinearGradient(
                          colors: [activeGradientStart, activeGradientEnd],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: active ? null : Colors.transparent,
                ),
                child: Icon(icon, size: active ? 30 : 22, color: active ? Colors.white : inactiveIcon),
              ),
              const SizedBox(height: 6),
              // Show label for inactive tabs; hide for the active one (inverse behavior)
              AnimatedSize(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeInOut,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: !active
                      ? Text(
                          label,
                          key: ValueKey('label_inactive_$index'),
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: inactiveIcon),
                        )
                      : const SizedBox.shrink(key: ValueKey('label_hidden')),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final container = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        gradient: const LinearGradient(colors: [Color.fromARGB(102, 255, 255, 255), Color.fromARGB(172, 255, 255, 255)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        border: Border.all(color: const Color(0x33FFFFFF)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 12)),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          item(Icons.sign_language, 'Aprender', activeIndex == 0, 0),
          item(Icons.translate, 'Traduzir', activeIndex == 1, 1),
          item(Icons.star, 'Pro', activeIndex == 2, 2),
          item(Icons.emoji_events, 'Ranking', activeIndex == 3, 3),
          item(Icons.person, 'Perfil', activeIndex == 4, 4),
        ],
      ),
    );

    if (floating) {
      // when floating we return a translucent blurred panel that doesn't touch the edges
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                // adapt width to screen with limits
                constraints: const BoxConstraints(minHeight: 50, maxHeight: 120),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.92), // whiter and more opaque
                  borderRadius: BorderRadius.circular(999),
                ),
                child: container,
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: container,
      ),
    );
  }
}
