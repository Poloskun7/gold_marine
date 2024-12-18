import 'package:flutter/material.dart';
import 'package:gold_marine/background.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
        return AnimatedGradient.gradient.createShader(bounds);
      },
        child: const Text('Аренда Яхт и катеров в Санкт-Петербурге', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Цвет текста должен быть белым для градиента
        ),)),
    );
  }
}