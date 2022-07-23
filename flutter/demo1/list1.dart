import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello Flutter"),
          ),
          body: HomeContent()),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.network(
          "https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b",
          alignment: Alignment.center,
          // fit: BoxFit.fill, // 鋪滿  會拉伸
          // fit: BoxFit.contain, // 原圖顯示
          // fit: BoxFit.cover, // 充滿容器 不變形
          repeat: ImageRepeat.repeatY,  // y軸 平鋪

          // 混合顔色
          // color: Colors.cyan,
          // colorBlendMode: BlendMode.screen,
        ),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }
}