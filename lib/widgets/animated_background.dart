import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryColors: const [
        Colors.deepPurple,
        Colors.purple,
      ],
      secondaryColors: const [
        Colors.deepPurpleAccent,
        Colors.purpleAccent,
      ],
      duration: const Duration(seconds: 5),
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomRight,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
    );
  }
}