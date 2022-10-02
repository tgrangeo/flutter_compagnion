import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;
  @override
  void initState() {
    getToken().then((value) => setState(() {
            token = value;
          }));
     
    }
  Future<String> getToken() async {
    final response = await http
        .post(Uri.parse("https://api.intra.42.fr/oauth/token"), body: {
      "grant_type": "client_credentials",
      "client_id":
          '4cb702e7f10ae5a81444e166ba2c2cbf8bf5ceba9f439e95d87a797c55e2f191',
      "client_secret":
          ''//insert secret
    });
    final jsonResponse = jsonDecode(response.body);
    String token1 = jsonResponse["access_token"] as String;
    return token1;
  }

  void _request(String pseudo) async {
    print(token);
    final response = await http.get(
        Uri.parse("https://api.intra.42.fr/v2/users/$pseudo"),
        headers: {"Authorization": "Bearer ${token}"});
    final jsonResponse2 = jsonDecode(response.body);
    print(jsonResponse2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onSubmitted: _request,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a pseudo',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
