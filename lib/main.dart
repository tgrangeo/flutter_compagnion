import 'package:flutter/material.dart';
import './styles.dart' as s;
import 'package:http/http.dart' as http; //request api
import 'package:flutter_dotenv/flutter_dotenv.dart'; //environment variable
import 'dart:convert'; //convert json
import 'view/second.dart';
import 'view/search_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    home: SearchPage(),
    routes: {
      "search": (context) => SearchPage(),
      "second": (context) => SecondRoute()
    },
  ));
}
