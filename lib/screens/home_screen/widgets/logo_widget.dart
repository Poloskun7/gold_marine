import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  const LogoWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRect(
        child: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/image/logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}