import 'package:flutter/material.dart';
import 'package:helloworld/pages/From.dart';
import '../Search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,  // x
        mainAxisAlignment: MainAxisAlignment.center, // y
        children: <Widget>[
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>SearchPage())
            );
          }, child: Text("跳轉到搜索")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>FromPage(title: 'hello from',))
            );
          }, child: Text("跳轉到表單并傳值")),
        ],
      ),
    );
  }
}