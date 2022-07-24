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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // x
          mainAxisAlignment: MainAxisAlignment.center, // y
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context)=>SearchPage())
                  // );
                  Navigator.pushNamed(context, "/search");
                },
                child: Text("跳轉到搜索")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context)=>FromPage(arguments: {
                  //     "name": 'hello from123'
                  //   },))
                  // );
                  Navigator.pushNamed(context, "/form",
                      arguments: {"name": 'hello from123'});
                },
                child: Text("跳轉到表單并傳值")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  // MaterialPageRoute(builder: (context)=>FromPage(arguments: {
                  //   "name": 'hello from'
                  // },))
                  // );
                  Navigator.pushNamed(context, "/product",
                      arguments: {"id": 'hello from', "name": 'hello from123'});
                },
                child: Text("跳轉到商品并傳值")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/appBarDemo",
                  );
                },
                child: Text("跳轉到BardDemo")),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Text("OK"),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(child: Container(
                  height: 50,
                  margin: EdgeInsets.all(20),
                  child: OutlinedButton(
                    child: Text("registry"),
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.orange)
                    ),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/form_demo",
                  );
                },
                child: Text("form_demo")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/datapick",
                  );
                },
                child: Text("datapick")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/datapick2",
                  );
                },
                child: Text("datapick2")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/swiperPage",
                  );
                },
                child: Text("swiperPage")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/dialogPage",
                  );
                },
                child: Text("dialogPage")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/scan",
                  );
                },
                child: Text("scan")),
          ],
        ),
      ),
    );
  }
}
