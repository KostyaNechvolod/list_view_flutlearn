import 'package:flutter/material.dart';

void main() => runApp(new FlutterApp());

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "FlutterApp",
      home: new Flutter(),
    );
  }
}

class Flutter extends StatefulWidget {
  @override
  createState() => new FlutterState();
}

class FlutterState extends State<Flutter> {
  var _mass = [];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("FlutterApp"),
        ),
        body: new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 30,
          itemBuilder: (BuildContext context, int position) {
            return _buildRow(position);
          },
        ));
  }

  Widget _buildRow(int i) {
    return new ListTile(
      leading: new Icon(Icons.account_circle, color: Colors.blue),
      title: new Text(
        "Some text",
        style: _biggerFont,
      ),
      subtitle: new Text("some text"),
      trailing: new Icon(Icons.arrow_forward_ios),
    );
  }
}
