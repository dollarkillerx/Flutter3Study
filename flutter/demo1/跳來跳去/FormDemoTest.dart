import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormDemoPage> {
  int? _sex = 0;
  bool _eat = false;
  bool _sleep = false;
  bool _coding = false;
  var info = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Test"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "輸入用戶信息",
              ),
            ),
            Row(
              children: <Widget>[
                Text("男"),
                Radio<int>(
                    value: 0,
                    groupValue: _sex,
                    onChanged: (int? e) {
                      setState(() {
                        _sex = e;
                      });
                    }),
                Text("女"),
                Radio<int>(
                    value: 1,
                    groupValue: _sex,
                    onChanged: (int? e) {
                      setState(() {
                        _sex = e;
                      });
                    }),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Eat"),
                    Checkbox(
                        value: _eat,
                        onChanged: (e) {
                          setState(() {
                            _eat = e!;
                          });
                        }),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Sleep"),
                    Checkbox(
                        value: _sleep,
                        onChanged: (e) {
                          setState(() {
                            _sleep = e!;
                          });
                        }),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Coding"),
                    Checkbox(
                        value: _coding,
                        onChanged: (e) {
                          setState(() {
                            _coding = e!;
                          });
                        }),
                  ],
                ),
              ],
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Despstion",
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: ElevatedButton(
                      child: Text("提交信息"),
                      onPressed: () {},
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
