import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("私はsearch page"),
      ),
      body: Center(child: Text("this is search page"),),
    );
  }
}