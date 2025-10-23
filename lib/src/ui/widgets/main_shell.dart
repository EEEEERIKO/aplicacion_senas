import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  final String currentLocation;
  const MainShell({super.key, required this.child, required this.currentLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // use a Stack so the navigation can float above the content
      body: Stack(
        children: [
          // subtle patterned background overlay (grid)
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                ),
                
              ),
            ),
          ),

          // main content, with extra bottom padding so content is not hidden
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: child,
          ),

          // halo behind floating nav
          Positioned(
            left: 0,
            right: 0,
            bottom: 18,
            child: Center(
              child: SizedBox(
                width: 360,
                height: 110,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // blurred circular halo
                    Container(
                      width: 260,
                      height: 260,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
                      ),
                    ),
                    AppBottomNavigation(currentRoute: currentLocation, floating: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x0D000000)
      ..strokeWidth = 0.5;

    const stepX = 14.0;
    const stepY = 24.0;

    for (double x = 0; x < size.width; x += stepX) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += stepY) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
