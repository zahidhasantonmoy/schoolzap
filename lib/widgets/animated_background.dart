import 'package:flutter/material.dart';
import 'package:animated_gradient/animated_gradient.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradient(
      colors: const [
        Colors.deepPurple,
        Colors.purple,
        Colors.deepPurpleAccent,
        Colors.purpleAccent,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}