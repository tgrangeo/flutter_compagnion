import 'package:flutter/material.dart';

abstract class Style {
  //button sign in and back
  static final button = OutlinedButton.styleFrom(
      elevation: 6,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      backgroundColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  //app
  static final app = ThemeData(
    scaffoldBackgroundColor: Colors.lightBlue[100],
    brightness: Brightness.light,
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
    image:  DecorationImage(image: AssetImage('lib/assets/background.png'), fit: BoxFit.fill, opacity: 0.33),
  );

  static const loginText = TextStyle(
    fontFamily: 'Arial',
    fontSize: 18,
    color: Colors.black,
    height: 1,
  );
}
