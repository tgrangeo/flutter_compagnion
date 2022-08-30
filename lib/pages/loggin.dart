import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../styles.dart';

class Loggin extends StatefulWidget {
  const Loggin({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Loggin> createState() => _LogginState();
}

class _LogginState extends State<Loggin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              style: Style.button,
              child: const Text(
                'Sign in here',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: () => GoRouter.of(context).go('/HomePage'),
            )
          ],
        ),
      ),
    );
  }
}