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
      tests.add({
        "title": 'hello world $i',
        "body": 'this is body this is body ././././././ -$i',
        "img": "https://pic1.zhimg.com/v2-73383c2844a04774ae5588f5aaffe8d0_r.jpg?source=1940ef5c"
      });
    }

    var tempList = tests.map((e) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 1,
            )
        ),
        // color: Colors.black26,
        // height: 10,
        child: Column(
          children: <Widget>[
            Image.network(e["img"],fit: BoxFit.fill,),
            SizedBox(
              height: 10,
            ),
            Text(e["title"], style: TextStyle(fontSize: 20),)
          ],
        ),
      );
    });

    var pl = tempList.toList();

    // GridView.count( 靜態網格
    return GridView.count(
      children: pl,
      crossAxisSpacing: 10, // 左右距離
      mainAxisSpacing: 10, // 上下間距
      // childAspectRatio: 1.2, // 子widget寬高比
      crossAxisCount: 2,  // 多少列
    );
  }
}
