import 'package:flutter/material.dart';

import 'list_view_screen.dart';

void main() => runApp(FlutterApp());

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterApp",
      home: ListViewScreen(),
    );
  }
}



