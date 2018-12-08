import 'package:flutter/material.dart';

import 'login_page.dart';

void main() => runApp( FlutterApp());

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: LoginPage(),
    );
  }
}
