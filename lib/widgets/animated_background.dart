
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('color1', ColorTween(begin: Colors.deepPurple.shade400, end: Colors.purple.shade400), duration: const Duration(seconds: 3))
      ..tween('color2', ColorTween(begin: Colors.deepPurple.shade800, end: Colors.purple.shade800), duration: const Duration(seconds: 3));

    return LoopAnimation<Movie>(
      tween: tween,
      duration: tween.duration,
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [value.get('color1'), value.get('color2')],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }
}
