import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: 'hero_widget',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity,
              'assets/images/bg.jpg',
              color: Colors.teal,
              colorBlendMode: BlendMode.darken,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white30,
              fontSize: 36.0,
              letterSpacing: 36.0,
            ),
          ),
        ),
      ],
    );
  }
}
