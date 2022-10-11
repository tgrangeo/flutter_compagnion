//import 'dart:html';

import 'package:flutter/material.dart';
import './styles.dart' as s; //convert json
import './profile.dart';

//widget
import 'widget/profile_picture.dart';
import 'widget/main_info.dart';

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
            children: <Widget>[
              ProfilePicture(p: personne),
              MainInfo(p: personne),
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
