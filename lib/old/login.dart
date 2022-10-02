import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:flutter_appauth/flutter_appauth.dart' as appAuth;
//import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;
import '../../styles.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bool _logged = true;
  void _isLoged() {
    if (_logged == true) {
      GoRouter.of(context).go('/HomePage');
      //debugPrint("logged = true");
    }
  }

  String? pichon;

  void login() async {
    final response = await http
        .post(Uri.parse("https://api.intra.42.fr/oauth/token"), body: {
      "grant_type": "client_credentials",
      "client_id":
          '4cb702e7f10ae5a81444e166ba2c2cbf8bf5ceba9f439e95d87a797c55e2f191',
      "client_secret":
         
    });
    final jsonResponse = jsonDecode(response.body);
    var token = jsonResponse["access_token"] as String;

    final response2 = await http.get(
        Uri.parse("https://api.intra.42.fr/v2/users/rpichon"),
        headers: {"Authorization": "Bearer $token"});
    final jsonResponse2 = jsonDecode(response2.body);
    setState(() {
      pichon = jsonResponse2["image_url"] as String;
    });
    print("pichon");
  }

  // String teuteu(String? test) {
  //   if (test != null) {
  //     return test as String;
  //   }
  //   else return "null"
  // }

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
            Image.network(pichon??""),
            OutlinedButton(
              style: Style.button,
              onPressed: login,
              child: const Text(
                'enter',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
