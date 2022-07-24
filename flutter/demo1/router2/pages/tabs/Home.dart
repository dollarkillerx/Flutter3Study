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
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context)=>SearchPage())
            // );
            Navigator.pushNamed(context, "/search");
          }, child: Text("跳轉到搜索")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context)=>FromPage(arguments: {
            //     "name": 'hello from123'
            //   },))
            // );
            Navigator.pushNamed(context, "/form",arguments: {
              "name": 'hello from123'
            });
          }, child: Text("跳轉到表單并傳值")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            // Navigator.of(context).push(
                // MaterialPageRoute(builder: (context)=>FromPage(arguments: {
                //   "name": 'hello from'
                // },))
            // );
            Navigator.pushNamed(context, "/product",arguments: {
              "id": 'hello from',
              "name": 'hello from123'
            }) ;

          }, child: Text("跳轉到商品并傳值")),
        ],
      ),
    );
  }
}