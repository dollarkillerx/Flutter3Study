import 'package:flutter/material.dart';

class FromPage extends StatelessWidget {
  final arguments;//定义常量

  FromPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    print(this.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments != null ? arguments['name'] : "From Page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("帰る"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("me is from"),
          ),
        ],
      ),
    );
  }
}