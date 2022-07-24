import 'package:flutter/material.dart';
import 'dart:async'; // 需要加入

class MyDialog extends Dialog {

  // 定時1.5s 后關閉這個dialog
  _showTime(context) {
    var timer;
    timer = Timer.periodic(Duration(milliseconds: 1500), (timer) {
      // 回調執行
      Navigator.pop(context); // 關閉dialog
      timer.cancel(); // 關閉定時器
    });
  }

  @override
  Widget build(BuildContext context) {
    _showTime(context);

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Text("關於我們"),
                      alignment: Alignment.center,
                    ),
                    Align(
                      child: Icon(Icons.close),
                      alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Text("我是内容............................."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
