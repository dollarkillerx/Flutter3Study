import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello Flutter"),
          ),
          body: HomeContent()),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tests = [];
    for (var i=0;i<30;i++) {
      tests.add(Container(
        child: Text("data- $i"),
        alignment: Alignment.center,
        color: Colors.greenAccent,
      ));
    }

    return GridView.count(
      children: <Widget>[
        ...tests,
      ],
      crossAxisSpacing: 1, // 左右距離
      mainAxisSpacing: 1, // 上下間距
      childAspectRatio: 0.7, // 子widget寬高比
      crossAxisCount: 2,  // 多少列
    );
  }
}
