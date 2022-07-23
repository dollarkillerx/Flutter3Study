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
    var list = <Widget>[];
    for (var i = 0; i < 10; i++) {
      list.add(Container(
        height: 180,
        width: 180,
        color: i%2>0?Colors.amber: Colors.green,
        child: ListView(
          children: <Widget>[
            ListTile(
                title: Text("噶沙司"),
                subtitle: Text("this is body")
            )
          ],
        ),
        // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      ));
    }

    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal, // horizontal 水平列表 vertical 垂直列表 默認
        children: <Widget>[
          ...list,
        ],
      ),
      height: 180,
    );
  }
}
