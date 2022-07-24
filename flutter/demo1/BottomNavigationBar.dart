import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBarEx(),
          appBar: AppBar(
            title: Text("Hello Flutter"),
          ),
          body: HomeContent()),
    );
  }
}

class BottomNavigationBarEx extends StatefulWidget {
  @override
  _BottomNavigationBarEx createState() => _BottomNavigationBarEx();
}

class _BottomNavigationBarEx extends State<BottomNavigationBarEx> {
  int action = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo), label: '军机处'),
        BottomNavigationBarItem(
            icon: Icon(Icons.center_focus_strong), label: '血滴子'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_alarm_outlined), label: '大理寺'),
      ],
      currentIndex: action,
      onTap: (e) {
        setState(() {
          action = e;
        });
      },
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
