import 'package:flutter/material.dart';

abstract class Style {
  static final button = OutlinedButton.styleFrom(
    elevation: 3,
    backgroundColor: Color.fromARGB(255, 200, 200, 200),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    foregroundColor: Color.fromARGB(255, 0, 0, 0),
  );

  static const errorText = TextStyle(
    color: Colors.red,
    fontSize: 20,
  );

  static final box = BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
    color: Color.fromARGB(143, 200, 200, 200),
  );

  static const background = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/background.png'),
        fit: BoxFit.fill,
        opacity: 0.33),
  );

  static const loginText = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1,
  );

  static const TextDiv = TextStyle(
    fontSize: 22,
    height: 1.5,
  );

  static const TextTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
}