import 'package:flutter/material.dart';
import 'package:helloworld/pages/Tabls.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabls(),
    );
  }
}

class HomeContent extends StatefulWidget {
  // const HomeContent({ Key? key }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int bu = 0;

  List<Widget> clist = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Chip(label: Text("Hello world")),
        ElevatedButton(
            onPressed: () {
              // 有變化的使用有狀態組件方法
              setState(() {
                bu++;
              });
            },
            child: Text("Add")),
        Chip(label: Text("El: $bu")),
        ElevatedButton(
            onPressed: () {
              // 有變化的使用有狀態組件方法
              setState(() {
                if (this.clist.length > 10) {
                  this.clist.clear();
                }
                this.clist.add(ListTile(
                      title: Text("State $bu"),
                      subtitle: Text("this is subtitle"),
                    ));
              });
            },
            child: Text("Add List")),
        // ListView(  // 動態變化只能使用.builder 生成
        //     shrinkWrap: true,
        //   children: clist,
        // )
        Column(
          children: clist,
        )
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: clist.length,
        //     itemBuilder: (context,index) {
        //     return clist[index];
        //     },
        // )
      ],
    );
  }
}
