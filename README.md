# Flutter3Study

### 目錄結構

- android   平臺相關代碼
- ios       平臺相關代碼
- lib       flutter相關代碼
- test      測試代碼
- pubspec.yaml  配置文件

### hello world

``` 
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 自定義組件  (StatelessWidget 無狀態的組件)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text('こんにちは　おはようございます　Flutter',textDirection: TextDirection.ltr,),
    );
  }
}
```

v2: 

``` 
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 自定義組件  (StatelessWidget 無狀態的組件)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext  context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter 勉強"),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text(
        'こんにちは　おはようございます　Flutter',
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}
```


##### Container

``` 
Container(
        child: object,
        height: 300.0,
        width: 300.0,
        // padding: EdgeInsets.all(50),  // 内邊距 EdgeInsets.all(50)  四個位置
        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),  // 内邊距
        margin: EdgeInsets.fromLTRB(1, 1, 1, 1), // 外邊距
        // transform: Matrix4.translationValues(100,0,0), // 位移動
        // transform: Matrix4.rotationZ(0.06),  // 沿Z軸旋轉0.3°
        alignment: Alignment.bottomLeft,  // 配置元素顯示位置
        decoration: BoxDecoration(   // 邊框
          color: Colors.green,
          border: Border.all(
              color: Colors.amber,
              width: 2.0
          ),
          borderRadius: BorderRadius.all(  // 邊框 圓角
            Radius.circular(20),
          ),
        ),
      ),
    )
```

##### text

``` 
Text(
    "hexxxxxxhexxxxxxhexxxxxxhexxxxxxhexxxxxxxxx123123",
    textAlign: TextAlign.right,
    overflow: TextOverflow.ellipsis,  // 溢出
    maxLines: 1,  // 最大行數
    // textScaleFactor: 2, // 文本縮放  (放大兩倍)
    style: TextStyle(
      fontSize: 16.0, // 字體大小
      color: Colors.deepPurple,  // 字體顔色
      fontWeight: FontWeight.w200, // 字體加粗
      fontStyle: FontStyle.italic, // 字體傾斜
      decoration: TextDecoration.lineThrough, // 裝飾綫條
      decorationColor: Colors.greenAccent,  // 裝飾綫條 color
      letterSpacing: 2.3, // 字間距
    ),
),
```

##### image

``` 
Image.network(
      "https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b",
    alignment: Alignment.center,
    // fit: BoxFit.fill, // 鋪滿  會拉伸
    // fit: BoxFit.contain, // 原圖顯示
    // fit: BoxFit.cover, // 充滿容器 不變形
    repeat: ImageRepeat.repeatY,  // y軸 平鋪

    // 混合顔色
    // color: Colors.cyan,
    // colorBlendMode: BlendMode.screen,
  )
```


##### List佈局1

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List listData = [];
    for (var i = 0; i < 10; i++) {
      listData.add({
        "title": 'Candy Shop - $i',
        "author": 'Mohamed Chahin - $i',
        "imageUrl":
            'https://pic2.zhimg.com/80/v2-73383c2844a04774ae5588f5aaffe8d0_720w.jpg?source=1940ef5c'
      });
    }

    // var tempList = [];
    // listData.forEach((element) {
    //   tempList.add(ListTile(
    //     title: Text(element["title"]),
    //     subtitle: Text(element["title"]),
    //   ));
    // });

    var tempList = listData.map((value) {
      return ListTile(
        leading: Image.network(value["imageUrl"]),
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
      );
    });

    return ListView(
      children: <Widget>[
        ...tempList.toList(),
      ],
    );
  }
}

```

##### List佈局2 網格

v1: 

``` 

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tests = [];
    for (var i=0;i<30;i++) {
      tests.add(Container(
        child: Text("data- $i"),
        alignment: Alignment.center,
        color: Colors.greenAccent,
      ));
    }

    return GridView.count(
      children: <Widget>[
        ...tests,
      ],
      crossAxisSpacing: 1, // 左右距離
      mainAxisSpacing: 1, // 上下間距
      childAspectRatio: 0.7, // 子widget寬高比
      crossAxisCount: 2,  // 多少列
    );
  }
}

```
