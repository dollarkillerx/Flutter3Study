import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  var username = new TextEditingController();
  var password = new TextEditingController();

  @override
  void initState() {  // 初始化生命周期
    super.initState();
    username.text = 'default';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("表單"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              // obscureText: true, // 密碼框
              controller: username, // 數據綁定
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "請輸入用戶名", // pleasehilen
                // border: OutlineInputBorder(),// 邊框
                labelText: "用戶名",
              ),
              onChanged: (e) {

              },
            ),
            SizedBox(height: 20,),
            TextField(
              obscureText: true, // 密碼框
              controller: password, // 數據綁定
              decoration: InputDecoration(
                icon: Icon(Icons.pages_sharp),
                hintText: "請輸入用戶名", // pleasehilen
                // border: OutlineInputBorder(),// 邊框
                labelText: "Password",
              ),
              onChanged: (e) {

              },
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  print(this.username.text);
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                      color: Colors.green
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}