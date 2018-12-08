import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  createState() => ListViewScreenState();
}

class ListViewScreenState extends State<ListViewScreen> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FlutterApp"),
        ),
        body: new ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: 30 * 2,
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return Divider();
            final index = position ~/2;
            return _buildRow(position);
          },
        ));
  }

  Widget _buildRow(int i) {
    return ListTile(
      leading: Icon(Icons.account_circle, color: Colors.blue),
      title: Text(
        "Some text",
        style: _biggerFont,
      ),
      subtitle: Text("some text"),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}