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
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(   // Stack 會將多個元素放置在一起
          children: <Widget>[  // 這個是堆叠的
            Positioned(
              top: 10,
              bottom: 0,
              left: 100,
              right: 0,
              child: Icon(Icons.home,size: 40, color: Colors.white,),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.search,size: 30, color: Colors.white,),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.send,size: 60, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  double? size;
  Color? color;
  IconData icon;

  IconContainer(this.icon, {this.color = Colors.white, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: Center(
        child: Icon(this.icon, size: this.size, color: this.color),
      ),
    );
  }
}
