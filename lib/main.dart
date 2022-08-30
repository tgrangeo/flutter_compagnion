// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/loggin.dart';
import 'pages/homepage.dart';
import '../styles.dart';

const AUTH_DOMAIN = String.fromEnvironment('42_DOMAIN');
const AUTH_CLIENT_ID = String.fromEnvironment('42_CLIENT_ID');
const AUTH_ISSUER = 'https://$AUTH_DOMAIN';
const BUNDLE_ID = 'com.example.swiftycompagnion';
const AUTH_REDIRECT_URI = '$BUNDLE_ID://callback';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Swifty_compagnion',
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Scaffold(
          body: Center(
              child: Loggin(title: "loggin",)
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/HomePage',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const Scaffold(
          body: Center(
              child: HomePage(
            title: "HomePage",
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

