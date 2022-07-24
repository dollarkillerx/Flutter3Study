import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, "/register");
        }, child: Text("注冊")),
        ElevatedButton(onPressed: () {
          Navigator.pushNamed(context, "/login");
        }, child: Text("登錄")),
      ],
    );
  }
}
