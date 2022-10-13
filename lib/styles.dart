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
    image:  DecorationImage(image: AssetImage('assets/background.png'), fit: BoxFit.fill, opacity: 0.33),
  );

  static const loginText = TextStyle(
    fontFamily: 'Arial',
    fontSize: 18,
    color: Colors.black,
    height: 1,
  );
}
