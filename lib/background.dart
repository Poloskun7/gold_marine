import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget? child;
  const Background({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0077BE), // Темно-синий цвет моря
            Color(0xFF00A3E0), // Светло-синий цвет моря
            Color(0xFF7EC8E3), // Голубой цвет моря
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: child ?? child,
    );
  }
}

class AnimatedGradient {
  static const LinearGradient gradient = LinearGradient(
    colors: [
      Color(0xFFD4AF37), // Золотой цвет
      Color(0xFFC59E2E), // Темнее золото
      Color(0xFFE6C750), // Светлее золото
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
