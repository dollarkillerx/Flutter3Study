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
        News(
            "https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b",
            "text"),
        News(
            "https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b",
            "text"),
        News(
            "https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b",
            "text"),
      ],
    );
  }
}

class News extends StatelessWidget {
  String img;
  String text;

  News(this.img,this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // child: Image.network(this.img,fit: BoxFit.fill),
      child: Stack(
        children: [
          Image.network(this.img,fit: BoxFit.fill,width: double.infinity,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(this.text,style: TextStyle(
                fontSize: 30,
                color: Colors.blue
            ),),),
        ],
      ),
    );
  }

}