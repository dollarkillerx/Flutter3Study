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
    for (var i=1;i<5;i++) {
      tests.add({
        "title": 'hello world $i',
        "body": 'this is body this is body ././././././ -$i',
        "img": "https://www.itying.com/images/flutter/${i}.png"
      });
    }
    for (var i=1;i<5;i++) {
      tests.add({
        "title": 'hello world $i',
        "body": 'this is body this is body ././././././ -$i',
        "img": "https://www.itying.com/images/flutter/${i}.png"
      });
    }
    for (var i=1;i<5;i++) {
      tests.add({
        "title": 'hello world $i',
        "body": 'this is body this is body ././././././ -$i',
        "img": "https://www.itying.com/images/flutter/${i}.png"
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
        child: Padding(
          child: Image.network(e["img"],fit: BoxFit.cover,),
          padding: EdgeInsets.all(6),
        ),
      );
    });

    var pl = tempList.toList();

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
        ),
        itemCount: pl.length,
        itemBuilder:(context,index) {
          return pl[index];
        });
  }
}
