import 'package:flutter/material.dart';

class FromPage extends StatelessWidget {
  String title;
  FromPage({this.title='私は From Page'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(this.title),
      // ),
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