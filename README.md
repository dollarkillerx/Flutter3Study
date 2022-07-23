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

### 佈局方式

- [ListTile 水平佈局 鋪滿一行](#ListView佈局)
- [GridView 網格佈局 鋪滿一行](#GridView網格)
- [Column 垂直佈局X軸 該多大就多大](#Column垂直佈局X軸)
- [Row 水平佈局Y軸 該多大就多大](#Row水平佈局Y軸)
- [Expanded => Flex](#Expanded=>Flex)
- [Stack定位佈局](#Stack定位佈局)

##### ListView佈局

(!ListView 不能嵌套!)

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

##### GridView網格

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


#### Column垂直佈局X軸

該多大就多大

``` 
Column(  
  children: <Widget>[
    Image.network(e["img"],fit: BoxFit.fill,),
    // SizedBox(
    //   height: 10,
    // ),
    Text(e["title"], style: TextStyle(fontSize: 20),)
  ],
),
```

##### Row水平佈局Y軸 

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return GridView.count(  // 鋪滿一行
    //   crossAxisCount: 3,
    //   children: <Widget>[
    //     IconContainer(Icons.home),
    //     IconContainer(Icons.join_left_outlined),
    //     IconContainer(Icons.equalizer),
    //   ],
    // );

    return Container(
      height: 600,
      width: 400,
      color: Colors.black,
      child: Row(
        children: <Widget>[
          IconContainer(Icons.home),
          IconContainer(Icons.join_left_outlined),
          IconContainer(Icons.equalizer),
        ],
        crossAxisAlignment: CrossAxisAlignment.start, // Y軸 默認居中
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 水平方向排列位置  (spaceEvenly 均匀分配)
      ),
    );
  }
```

##### Expanded=>Flex

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
       Expanded(
           child:  IconContainer(Icons.search, color: Colors.blue),
         flex: 1,  // 占用1份
       ),
        Expanded(
          child: IconContainer(Icons.home, color: Colors.yellow),
          flex: 2, // 占用2份
        ),
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconContainer(Icons.search, color: Colors.blue), // 固定寬度
        Expanded(  // 自適應
          child: IconContainer(Icons.home, color: Colors.yellow),
          flex: 2, // 占用2份
        ),
      ],
    );
  }
}
```

小練習

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image.network("https://www.itying.com/images/flutter/1.png"),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.network("https://www.itying.com/images/flutter/2.png"),
              ),
              Expanded(
                flex: 1,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Image.network("https://www.itying.com/images/flutter/3.png"),
                        Image.network("https://www.itying.com/images/flutter/4.png"),
                      ],
                    ),
                  ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

```

#### Stack定位佈局

- Stack (Positioned[精確],Align)

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(   // Stack 會將多個元素放置在一起
        // alignment: Alignment.center, // 讓所有的元素居中  (預設)
        alignment: Alignment(0,0.5), // 左右,上下 自定義
        children: <Widget>[  // 這個是堆叠的
          Container(
            height: 400,
            width: 300,
            color: Colors.red,
          ),
          Text("わたしはtextです",style: TextStyle(
            fontSize: 40,
            color: Colors.white
          ),),
          // Text("僕もtextです"),
        ],
      ),
    );
  }
}

```

v2:

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(   // Stack 會將多個元素放置在一起
          children: <Widget>[  // 這個是堆叠的
            Positioned(
              top: 10,
              bottom: 0,
              left: 100,
              right: 0,
              child: Icon(Icons.home,size: 40, color: Colors.white,),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.search,size: 30, color: Colors.white,),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.send,size: 60, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
```

##### AspectRatio

設置相對於父元素的寬高比

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: AspectRatio(
        aspectRatio: 2.0/1.0, // 父元素 寬度 高度 比  (圖片平鋪用的比較多)
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
```

##### Card

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("張三",style: TextStyle(fontSize: 28),),
                subtitle: Text("高級軟件工程師"),
              ),
              ListTile(
                title: Text("電話： 10086"),
              ),
              ListTile(
                title: Text("地址： xxxxxx"),
              ),
            ],
          ),
        ),Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("張三",style: TextStyle(fontSize: 28),),
                subtitle: Text("高級軟件工程師"),
              ),
              ListTile(
                title: Text("電話： 10086"),
              ),
              ListTile(
                title: Text("地址： xxxxxx"),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("張三",style: TextStyle(fontSize: 28),),
                subtitle: Text("高級軟件工程師"),
              ),
              ListTile(
                title: Text("電話： 10086"),
              ),
              ListTile(
                title: Text("地址： xxxxxx"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
```

佈局單元測試: 

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardItem("Candy Shop", "description description",
            "https://www.itying.com/images/flutter/1.png"),
        CardItem("Candy Shop", "description description",
            "https://www.itying.com/images/flutter/1.png"),
        CardItem("Candy Shop", "description description",
            "https://www.itying.com/images/flutter/1.png"),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  String name;
  String description;
  String img;

  CardItem(this.name, this.description, this.img);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              this.img,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: CircleAvatar( // 專用圖片處理成頭像
              backgroundImage: NetworkImage(this.img),
            ),
            // leading: ClipOval(   // 剪切成圓形
            //   child: Image.network(this.img,fit: BoxFit.cover, width: 60,height: 60,),
            // ),
            title: Text(
              this.name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              this.description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class CardItem extends StatelessWidget {
//   String name;
//   String description;
//   String img;
//
//   CardItem(this.name, this.description, this.img);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(10),
//       child: Column(
//         children: <Widget>[
//           AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Image.network(
//               this.img,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: ClipOval(
//
//                   child: Image.network(this.img,fit: BoxFit.cover, width: 10,),
//                 ),
//                 flex: 1,
//               ),
//               Expanded(
//                 flex: 4,
//                 child: ListTile(
//                   title: Text(
//                     this.name,
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   subtitle: Text(
//                     this.description,
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black26,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

```
