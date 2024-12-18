import 'package:flutter/material.dart';
import 'package:gold_marine/background.dart';

class BookingButtonWidget extends StatelessWidget {
  const BookingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
          gradient: AnimatedGradient.gradient,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: const Text(
          'Забронировать',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
