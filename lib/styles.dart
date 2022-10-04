import 'package:flutter/material.dart';

abstract class Style {
  //button sign in and back
  static final button = OutlinedButton.styleFrom(
      elevation: 6,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      backgroundColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
  );

  //app
  static final app = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.light,
  );

  static const errorText = TextStyle(
    color: Colors.red, 
    fontSize: 20,
  );
}
