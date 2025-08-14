
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<String>()
      ..add("color1", ColorTween(begin: Colors.deepPurple.shade400, end: Colors.purple.shade400))
      ..add("color2", ColorTween(begin: Colors.deepPurple.shade800, end: Colors.purple.shade800));

    return LoopAnimation<MultiTweenValues<String>>(
      tween: tween,
      duration: const Duration(seconds: 3),
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [value.get("color1"), value.get("color2")],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.5);
    for (var particle in particles) {
      canvas.drawCircle(Offset(particle.x, particle.y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Particle {
  double x;
  double y;
  double size;
  double speed;

  Particle({required this.x, required this.y, required this.size, required this.speed});

  void move() {
    y -= speed;
  }
}
