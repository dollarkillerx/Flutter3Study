import 'package:flutter/material.dart';
import 'tabs/Home.dart';
import 'tabs/Setting.dart';
import 'tabs/Category.dart';

class Tabls extends StatefulWidget {
  @override
  _Tabls createState() => _Tabls();
}

class _Tabls extends State<Tabls> {
  int action = 0;

  List pageList = [HomePage(),CategoryPage(),SettingPage()];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        bottomNavigationBar: BottomNavigationBar(
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
        ),
        body: this.pageList[this.action],
        appBar: AppBar(
          title: Text("Hello Flutter"),
        ),
      );
  }
}
