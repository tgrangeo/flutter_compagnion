import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './styles.dart' as s;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token;
  bool? exist;
  @override
  void initState() {
    getToken().then((value) => setState(() {
          token = value;
        }));
  }

  Future<String> getToken() async {
    print(dotenv.env['SECRET']);
    final response =
        await http.post(Uri.parse("${dotenv.env['URL']}/oauth/token"), body: {
      "grant_type": "client_credentials",
      "client_id": dotenv.env['UID'],
      "client_secret": dotenv.env['SECRET']
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      String token1 = jsonResponse["access_token"] as String;
      return token1;
    } else {
      return '';
    }
  }

  void _request(String pseudo) async {
    try {
      final response = await http.get(
          Uri.parse("${dotenv.env['URL']}/v2/users/$pseudo"),
          headers: {"Authorization": "Bearer ${token}"});
      switch (response.statusCode) {
        case 200:
          {
            final dynamic jsonResponse = jsonDecode(response.body);
            print(jsonResponse);
            return;
          }
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      setState(() {
        exist = false;
      });
      return;
    }
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
            exist == false
                ? //display error message when pseudo don't exist
                const Text('pseudo not found, try again',
                    style: s.Style.errorText)
                : const Text(''),
          ],
        ),
      ),
    ));
  }
}
