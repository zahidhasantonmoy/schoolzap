import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 10),
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.lerp(Colors.deepPurple.shade400, Colors.purple.shade400, value)!,
                Color.lerp(Colors.deepPurple.shade800, Colors.purple.shade800, value)!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }
}