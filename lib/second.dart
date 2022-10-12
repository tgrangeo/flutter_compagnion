//import 'dart:html';

import 'package:flutter/material.dart';
import './styles.dart' as s; //convert json
import './profile.dart';

//widget
import 'widget/profile_picture.dart';
import 'widget/main_info.dart';
import 'widget/last_projects.dart';
import 'widget/skills.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        decoration: s.Style.background,
        child:SizedBox(
          width: 600,
          child: SingleChildScrollView(
            child: Column(
             // mainAxisSize: MainAxisSize.max,
             //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ProfilePicture(p: personne),
                MainInfo(p: personne),
                LastProjects(p: personne),
                Skills(p: personne),
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
      ),
    );
  }
}
