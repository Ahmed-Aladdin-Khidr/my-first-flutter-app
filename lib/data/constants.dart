import 'package:flutter/material.dart';

class kTextStyle {
  static const String themeModeKey = 'themeModeKey';
  static const TextStyle titleTealText = TextStyle(
    color: Colors.teal,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle descriptionText = TextStyle(
    fontSize: 16.0,
  );
}

class KHomePage { 
  static const List<String> titles = [
    'Cross-Platform Magic',
    'Beautiful UI by Default',
    'Performance That Shines',
  ];
  static const List<String> descriptions = [
    'Build beautiful native apps for iOS, Android, Web, Desktop, and more from a single codebase. Flutter\'s hot reload lets you see changes instantly, making development a breeze!',
    'Flutter comes with a rich set of Material Design and Cupertino widgets. Create stunning, pixel-perfect interfaces that feel native on every platform with smooth 60fps animations.',
    'Flutter compiles to native ARM code, delivering exceptional performance. The framework uses the Skia graphics engine to render every pixel, ensuring buttery-smooth experiences.',
  ];
}