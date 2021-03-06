import 'package:flutter/material.dart';

import 'login_page.dart';
import 'list_view_screen.dart';

void main() => runApp(FlutterApp());

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/login_screen': (BuildContext context) => ListViewScreen()
      },
    );
  }
}
