//import 'dart:html';

import 'package:flutter/material.dart';
import './styles.dart' as s;
import 'package:http/http.dart' as http; //request api
import 'package:flutter_dotenv/flutter_dotenv.dart'; //environment variable
import 'dart:convert'; //convert json
import './profile.dart';

class SecondRoute extends StatefulWidget {
  final dynamic json;

  SecondRoute({super.key, this.json});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondRoute> {
  late Profile personne;
  @override
  void initState() {
    personne = Profile(widget.json);
    print(personne.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 160),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 95,
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage(personne.picture),
                ),
              ),
              Text("login: ${personne.login}"),
              Text("level: ${personne.level}"),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "search");
                },
                child: const Text('Go back!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
