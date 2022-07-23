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
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("張三",style: TextStyle(fontSize: 28),),
                subtitle: Text("高級軟件工程師"),
              ),
              ListTile(
                title: Text("電話： 10086"),
              ),
              ListTile(
                title: Text("地址： xxxxxx"),
              ),
            ],
          ),
        ),Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("張三",style: TextStyle(fontSize: 28),),
                subtitle: Text("高級軟件工程師"),
              ),
              ListTile(
                title: Text("電話： 10086"),
              ),
              ListTile(
                title: Text("地址： xxxxxx"),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("張三",style: TextStyle(fontSize: 28),),
                subtitle: Text("高級軟件工程師"),
              ),
              ListTile(
                title: Text("電話： 10086"),
              ),
              ListTile(
                title: Text("地址： xxxxxx"),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class News extends StatelessWidget {
  String img;
  String text;

  News(this.img, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // child: Image.network(this.img,fit: BoxFit.fill),
      child: Stack(
        children: [
          Image.network(
            this.img,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              this.text,
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
