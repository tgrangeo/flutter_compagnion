import 'dart:io';

import 'package:flutter/material.dart';
import '../styles.dart' as s;
import 'package:http/http.dart' as http; //request api
import 'package:flutter_dotenv/flutter_dotenv.dart'; //environment variable
import 'dart:convert'; //convert json
import './second.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? token;
  bool? exist;
  final TextController = TextEditingController();
  @override
  void initState() {
    getToken().then((value) => {token = value});
  }

  Future<String> getToken() async {
    final response =
        await http.post(Uri.parse("${dotenv.env['URL']}/oauth/token"), body: {
      "grant_type": "client_credentials",
      "client_id": dotenv.env['UID'],
      "client_secret": dotenv.env['SECRET']
    });
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      String token1 = jsonResponse["access_token"] as String;
      return token1;
    } else {
      return '';
    }
  }

  void goToProfile(json) async {
    TextController.text = "";
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondRoute(json: json),
      ),
    );
  }

  void _request(String pseudo) async {
    if (pseudo == "") {
      return;
    }
    try {
      final response = await http.get(
          Uri.parse("${dotenv.env['URL']}/v2/users/$pseudo"),
          headers: {"Authorization": "Bearer $token"});
      switch (response.statusCode) {
        case 200:
          final dynamic jsonResponse = jsonDecode(response.body);
          goToProfile(jsonResponse);
          return;
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

  void _requestButton() async {
    String pseudo = TextController.text;
    if (pseudo == "") {
      return;
    }
    try {
      final response = await http.get(
          Uri.parse("${dotenv.env['URL']}/v2/users/$pseudo"),
          headers: {"Authorization": "Bearer $token"});
      switch (response.statusCode) {
        case 200:
          final dynamic jsonResponse = json.decode(response.body);
          goToProfile(jsonResponse);
          return;
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
            body: Container(
      decoration: s.Style.background,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
                width: 300,
                child: Padding(
                  padding: EdgeInsets.only(top: 140, bottom: 50),
                  child: Image(
                      image: AssetImage('assets/logo.png'), fit: BoxFit.cover),
                )),
            TextField(
              autocorrect: false,
              controller: TextController,
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
            OutlinedButton(
              onPressed: _requestButton,
              style: s.Style.button,
              child: const Text('search'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 310),
              child: Text("made by tgrangeo"),
            )
          ],
        ),
      ),
    )));
  }
}
