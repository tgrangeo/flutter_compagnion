import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title, required this.token}) : super(key: key);
  final String title;
  final String token;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String _pseudo = "";

  void _getPseudo(String str) {
    setState(() {
      _pseudo = str;
    });
  }

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
            TextField(
              onSubmitted: _getPseudo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a pseudo',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
            Text(
              'you are looking for $_pseudo',
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
            OutlinedButton(
              style: Style.button,
              child: const Text(
                'back',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: () => GoRouter.of(context).go('/'),
            )
          ],
        ),
      ),
    );
  }
}
