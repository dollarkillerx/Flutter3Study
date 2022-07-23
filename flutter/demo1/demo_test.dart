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
    return ListView(
      children: <Widget>[
        Image.network("https://www.itying.com/images/flutter/1.png"),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.network("https://www.itying.com/images/flutter/2.png"),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.network("https://www.itying.com/images/flutter/3.png"),
                      Image.network("https://www.itying.com/images/flutter/4.png"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
