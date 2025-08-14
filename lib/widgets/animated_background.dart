
import 'package:flutter/material.dart';
import 'package:animated_gradient/animated_gradient.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradient(
      colors: [
        Colors.deepPurple.shade400,
        Colors.purple.shade400,
        Colors.deepPurple.shade800,
        Colors.purple.shade800,
      ],
      duration: const Duration(seconds: 5),
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
