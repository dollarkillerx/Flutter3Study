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

  List pageList = [HomePage(), CategoryPage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: '军机处'),
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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: DrawerHeader(
                    child: Text("hello flutter"),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(child: UserAccountsDrawerHeader(
                  accountName: Text("Dollarkiller"),
                  accountEmail: Text("dollarkiller@dollarkiller.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage("https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b"),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("用戶中心"),
              onTap: () {
                Navigator.of(context).pop(); // 關閉側邊欄
                Navigator.pushNamed(context, "/login");
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("設置"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("用戶中心"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("設置"),
            ),
          ],
        ),
      ),
      // 左側邊欄
      endDrawer: Drawer(
        child: Text("右側邊欄"),
      ), // 右側邊欄
    );
  }
}
