import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LearnScreen extends ConsumerWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Header
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('WASHOE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Row(
                      children: const [
                        _StatIcon(icon: Icons.local_fire_department, value: '0'),
                        SizedBox(width: 12),
                        _StatIcon(icon: Icons.favorite, value: '5'),
                        SizedBox(width: 12),
                        _StatIcon(icon: Icons.monetization_on, value: '100'),
                      ],
                    )
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 8, bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      // Title centered; image removed per request
                      Center(
                        child: Text('Estágio 1: Introdução à Libras', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 18),

                      // Centered activities connected by a decorative vertical path
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // build stages with connectors between
                          _StageWithConnector(title: 'Alfabeto Manual', icon: Icons.sign_language, enabled: true, isLast: false),
                          _StageWithConnector(title: 'Saudações Básicas', icon: Icons.waving_hand, enabled: true, isLast: false),
                          _StageWithConnector(title: 'Números de 1 a 10', icon: Icons.lock, enabled: false, isLast: true),
                        ],
                      ),
                      const SizedBox(height: 18),
                      const SizedBox(height: 24),

                      Text('Estágio 2: Conversas do Dia a Dia', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      _LessonStage(title: 'Minha Família', icon: Icons.lock, enabled: false),
                      const SizedBox(height: 12),
                      _LessonStage(title: 'Comidas e Bebidas', icon: Icons.lock, enabled: false),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _StageWithConnector extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool enabled;
  final bool isLast;
  const _StageWithConnector({required this.title, required this.icon, this.enabled = true, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // the circular activity
        GestureDetector(
          onTap: enabled ? () {} : null,
          child: Column(
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: enabled ? const LinearGradient(colors: [Color(0xFF13A4EC), Color(0xFF00CFE6)]) : null,
                  color: enabled ? null : Theme.of(context).dividerColor.withOpacity(0.08),
                  boxShadow: enabled ? [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 12, offset: Offset(0,6))] : null,
                ),
                child: Icon(icon, size: 40, color: enabled ? Colors.white : Colors.grey[400]),
              ),
              const SizedBox(height: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: enabled ? null : Colors.grey[500])),
            ],
          ),
        ),
        // connector (if not last)
        if (!isLast)
          SizedBox(
            height: 56,
            child: Center(
              child: SizedBox(
                width: 6,
                height: 56,
                child: CustomPaint(painter: _VerticalPathPainter()),
              ),
            ),
          ),
      ],
    );
  }
}

class _VerticalPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final r = RRect.fromRectAndRadius(rect, Radius.circular(8));

    // draw a soft rounded column (background)
    final bgPaint = Paint()..color = Colors.grey.withOpacity(0.12);
    canvas.drawRRect(r, bgPaint);

    // draw gradient inner line
    final linePaint = Paint()
      ..shader = const LinearGradient(colors: [Color(0xFF13A4EC), Color(0xFF00CFE6)]).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final centerX = size.width / 2;
    canvas.drawLine(Offset(centerX, 6), Offset(centerX, size.height - 6), linePaint);

    // draw decorative dots along the line
    final dotPaint = Paint()..color = Colors.white;
    final dotPositions = [0.2, 0.5, 0.8];
    for (final t in dotPositions) {
      final y = size.height * t;
      canvas.drawCircle(Offset(centerX, y), 3.0, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
class _StatIcon extends StatelessWidget {
  final IconData icon;
  final String value;
  const _StatIcon({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange, size: 24),
        const SizedBox(width: 6),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}

class _LessonStage extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool enabled;
  const _LessonStage({required this.title, required this.icon, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    final content = Column(
      children: [
        GestureDetector(
          onTap: enabled ? () {} : null,
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: enabled ? const LinearGradient(colors: [Color(0xFF13A4EC), Color(0xFF00CFE6)]) : null,
                  color: enabled ? null : Theme.of(context).dividerColor.withOpacity(0.1),
                  boxShadow: enabled ? [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 12)] : null,
                ),
                child: Icon(icon, size: 36, color: enabled ? Colors.white : Colors.grey[400]),
              ),
              const SizedBox(height: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: enabled ? null : Colors.grey[500])),
            ],
          ),
        ),
      ],
    );

    if (!enabled) {
      return Opacity(opacity: 0.6, child: content);
    }
    return content;
  }
}
