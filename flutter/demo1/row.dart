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
    // return GridView.count(
    //   crossAxisCount: 3,
    //   children: <Widget>[
    //     IconContainer(Icons.home),
    //     IconContainer(Icons.join_left_outlined),
    //     IconContainer(Icons.equalizer),
    //   ],
    // );

    return Container(
      height: 600,
      width: 400,
      color: Colors.black,
      child: Row(
        children: <Widget>[
          IconContainer(Icons.home),
          IconContainer(Icons.join_left_outlined),
          IconContainer(Icons.equalizer),
        ],
        crossAxisAlignment: CrossAxisAlignment.start, // Y軸 默認居中
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 水平方向排列位置  (spaceEvenly 均匀分配)
      ),
    );
  }
}

class IconContainer extends StatelessWidget {

  double? size;
  Color? color;
  IconData icon;

  IconContainer(this.icon,{this.color = Colors.white,this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: Center(
        child: Icon(this.icon,size: this.size, color: this.color),
      ),
    );
  }

}