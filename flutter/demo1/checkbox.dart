import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  var flage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            activeColor: Colors.red, // 選中顔色
            value: this.flage,
            onChanged: (v) {
              setState(() {
                this.flage = !this.flage;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          CheckboxListTile(
            value: this.flage,
            onChanged: (e) {
              setState(() {
                this.flage = !this.flage;
              });
            },
            title: Text("this is title"),
            subtitle: Text("this is subtitle"),
          ),
          Divider(),
          CheckboxListTile(
            value: this.flage,
            onChanged: (e) {
              setState(() {
                this.flage = !this.flage;
              });
            },
            title: Text("this is title"),
            subtitle: Text("this is subtitle"),
            secondary: Icon(Icons.hail),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true, // 密碼框
            decoration: InputDecoration(
              icon: Icon(Icons.pages_sharp),
              hintText: "請輸入用戶名", // pleasehilen
              // border: OutlineInputBorder(),// 邊框
              labelText: "Password",
            ),
            onChanged: (e) {},
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                print(this.flage);
              },
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
