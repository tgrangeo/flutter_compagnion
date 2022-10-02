// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login.dart';
import 'homepage.dart';
import '../../styles.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String token = getToken;
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Swifty_compagnion',
    );
  }
}

Future<String> getToken() async {
  final response =
      await http.post(Uri.parse("https://api.intra.42.fr/oauth/token"), body: {
    "grant_type": "client_credentials",
    "client_id":
        '4cb702e7f10ae5a81444e166ba2c2cbf8bf5ceba9f439e95d87a797c55e2f191',
    "client_secret":
        'd07b1bdb04f3a43679b3cc78d6d7d1d0ffae9db9514987110db39811d257de03'
  });
  final jsonResponse = jsonDecode(response.body);
  String token = jsonResponse["access_token"] as String;
  return token;
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/HomePage',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
              child: HomePage(
            title: "HomePage",
            token: token,
          )), //Text('HomePage')
        ),
      ),
    )
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(child: Text(state.error.toString())),
    ),
  ),
);
