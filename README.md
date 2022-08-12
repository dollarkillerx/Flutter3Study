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
- [AspectRatio 圖片寬高規範](#AspectRatio) 
- [Card](#Card)
- [Wrap流佈局](#Wrap流佈局)

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

解決溢出 `SingleChildScrollView` 外面包一層就可以滑動了

``` 
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column()
```

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

主要用於控制圖片寬高

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


##### Wrap流佈局

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10, // x 間距
      runSpacing: 10, // y 間距
      // alignment: WrapAlignment.spaceEvenly,  // x
      runAlignment: WrapAlignment.end,
      children: <Widget>[
        MyButton("text1"),
        MyButton("text2"),
        MyButton("text2"),
        MyButton("text2"),
        MyButton("text2"),
        MyButton("text2"),
        MyButton("text2"),
        MyButton("text3"),
        MyButton("text4"),
      ],
    );
  }
}
```


#### 狀態
- StatelessWidget 無狀態組件
- StatefulWidget 有狀態組件

``` 
class HomeContent extends StatefulWidget{

  // const HomeContent({ Key? key }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int bu = 0;

  List<Widget> clist = [];
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Chip(label: Text("Hello world")),
        ElevatedButton(onPressed: (){

          // 有變化的使用有狀態組件方法
          setState(() {
            bu++;
          });

        }, child: Text("Add")),
        Chip(label: Text("El: $bu")),
        ElevatedButton(onPressed: (){

          // 有變化的使用有狀態組件方法
          setState(() {
            if (this.clist.length > 10) {
              this.clist.clear();
            }
            this.clist.add(ListTile(
              title: Text("State $bu"),
              subtitle: Text("this is subtitle"),
            ));
          });

        }, child: Text("Add List")),
        // ListView(  // 動態變化只能使用.builder 生成
        //     shrinkWrap: true,
        //   children: clist,
        // )
        Column(
          children: clist,
        )
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: clist.length,
        //     itemBuilder: (context,index) {
        //     return clist[index];
        //     },
        // )
      ],
    );
  }
}
```

###### BottomNavigationBar

``` 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBarEx(),
          appBar: AppBar(
            title: Text("Hello Flutter"),
          ),
          body: HomeContent()),
    );
  }
}

class BottomNavigationBarEx extends StatefulWidget {
  @override
  _BottomNavigationBarEx createState() => _BottomNavigationBarEx();
}

class _BottomNavigationBarEx extends State<BottomNavigationBarEx> {
  int action = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo), label: '军机处'),
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
    );
  }

}
```

v2 

``` 
class Tabls extends StatefulWidget {
  @override
  _Tabls createState() => _Tabls();
}

class _Tabls extends State<Tabls> {
  int action = 0;

  List pageList = [HomePage(),CategoryPage(),SettingPage()];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_a_photo), label: '军机处'),
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
    );
  }
}
```

##### Router 

Navigator.push  前進

Navigator.pop  返回上一級

基本路由,   命名路由

``` 
  floatingActionButton: FloatingActionButton(
    child: Text("帰る"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
  
  ElevatedButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>SearchPage())
            );
  }, child: Text("跳轉到搜索")),
      
  
  ElevatedButton(onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>FromPage(title: 'hello from',))
  );
```

命名路由：

``` 

// 1. 根組件  MaterialApp 配置錄音
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabls(),
      routes: {
        '/form': (context)=>FromPage(),
        '/search': (context)=>SearchPage(),
      },
    );
  }
}

// 2 跳轉： Navigator.pushNamed(context, "/search");
```

傳值:

https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments

``` 
class MyApp extends StatelessWidget {
  final routes = {
    '/form': (context, {arguments})=>FromPage(),
    '/search': (context)=>SearchPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabls(),
      routes: routes,
      onGenerateRoute: (RouteSettings settings) {
        final String? name = settings.name;
        final Function pageContentBuilder = routes[name] as Function;
        if (pageContentBuilder != null) {
          if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            final Route route =
            MaterialPageRoute(builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
      },
    );
  }
}

// 跳轉
ElevatedButton(onPressed: (){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>FromPage(arguments: {
        "name": 'hello from'
      },))
    );
}, child: Text("跳轉到表單并傳值")),

// 無狀態接受
class FromPage extends StatelessWidget {
  final arguments;//定义常量

  FromPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments != null ? arguments['name'] : "From Page"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("me is from"),
          ),
        ],
      ),
    );
  }
}


有狀態：

class ProductPage extends StatefulWidget {
  final Map? arguments;//定义参数映射对象 final 常量
  //可选参数定义
  ProductPage({this.arguments,Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState(arguments: this.arguments);
}

class _ProductPageState extends State<ProductPage> {
  Map? arguments; //组件内定义接收值
  _ProductPageState({this.arguments});//构造函数接收可选参数

  @override
  Widget build(BuildContext context) {

    print("xx");
    print(this.arguments);
    print("xx2");
    return Scaffold(
      appBar: AppBar(title: Text("Product"),),
      body: Container(
        child: Center(
          child: Text("this is Product ${arguments != null ? arguments!['id'] :"没有id"}"),
          // child: Text("this is Product"),
        ),
      ),
    );
  }
}
```

頁面跳轉操作

``` 
  // 返回根 并清空前面所以的路由
  Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => new Tabls()), (route) => route == null);
  // 加載新頁面並替換當前頁面
  // Navigator.of(context).pushReplacementNamed("/register_second");
  // Navigator.pushNamed(context, "/register_second");
```

DrawerHeader 側邊佈局

``` 
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
```

##### 基礎表單：

TextField: 

``` 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("表單"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              obscureText: true, // 密碼框
              decoration: InputDecoration(
                icon: Icon(Icons.verified_user),
                hintText: "請輸入", // pleasehilen
                border: OutlineInputBorder(),// 邊框
                labelText: "用戶名",
              ),
            ),
            TextField(
              maxLines: 4, // 多行文本框
              decoration: InputDecoration(
                hintText: "請輸入2", // pleasehilen
                labelText: "描述",
              ),
            ),
          ],
        ),
      ),
    );
  }
```

數據綁定: 

``` 
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
```

##### checkbox

``` 
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
```

##### radio

``` 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Man"),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.lafayette,
                groupValue: this.sex,
                onChanged: (SingingCharacter? e) {
                  setState(() {
                    this.sex = e;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Waman"),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.jefferson,
                groupValue: this.sex,
                onChanged: (SingingCharacter? e) {
                  setState(() {
                    this.sex = e;
                  });
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RadioListTile<SingingCharacter>(
              title: const Text("Man"),
                value: SingingCharacter.lafayette,
                groupValue: this.sex,
                onChanged: (SingingCharacter? e) {
                  setState(() {
                    this.sex = e;
                  });
                },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text("Wuman"),
              value: SingingCharacter.jefferson,
              groupValue: this.sex,
              onChanged: (SingingCharacter? e) {
                setState(() {
                  this.sex = e;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


```

###### switch

``` 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Switch(value: this.flag, onChanged: (e) {
              setState(() {
                this.flag = e;
              });
            }),
          ],
        ),
      ),
    );
  }
```

##### 時間相關操作

- time_format `第三方包: date_format`

``` 
    var now = DateTime.now(); // 獲取當前日期
    print(now);
    print(now.microsecondsSinceEpoch);
    print(now.millisecondsSinceEpoch);
    print(DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch));
    print(formatDate(DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch), [yyyy, '-', mm, '-', dd]));

```

- 選擇時間  showDatePicker(日期選擇)  showTimePicker(時間選擇)

``` 
  @override
  void initState() {
    super.initState();
    print(now);
    print(now.microsecondsSinceEpoch);
    print(now.millisecondsSinceEpoch);
    print(DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch));
    print(formatDate(
        DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch),
        [yyyy, '-', mm, '-', dd]));
  }

  // _showDatePicker() {
  //   showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(1980),
  //       lastDate: DateTime(2100),
  //   ).then((value) => {
  //     print(value)
  //   });
  // }

  String _selectTime = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);

  // 通過異步方式
  _showDatePicker() async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    );
    setState(() {
      _selectTime = formatDate(result!, [yyyy, '-', mm, '-', dd]);
    });
  }

  _showDatePicker2() async {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // 當前小時分鐘時間
    ).then((value) => {
          // setState(() {
          //   _selectTime = formatDate(value!, [yyyy, '-', mm, '-', dd]);
          // })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataPicker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_selectTime),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: () {
                  // 打開日期組件
                  _showDatePicker();
                },
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("10:00"),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: () {
                  // 打開日期組件
                  _showDatePicker2();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
```

三方插件 `flutter_datetime_picker`

``` 
class _DataPickerPageState2 extends State<DataPickerPage2> {
  var timeNow = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataPicker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(timeNow),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: () {
                  // 打開日期組件
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2100, 6, 7), onChanged: (date) {
                    // 滑動的
                    print('change $date');
                  }, onConfirm: (date) {
                    // 選中的
                    setState(() {
                      timeNow = formatDate(date, [yyyy, '-', mm, '-', dd]);
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.zh);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
```

###### flutter 本地化

https://juejin.cn/post/7013486679365255176

1. 修改 pubspec.yaml

``` 
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```

2. 修改main

``` 
import 'package:flutter/material.dart';
import 'package:helloworld/pages/Tabls.dart';
import 'routes/Routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 國際化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],
    );
  }
}
```

#### 解決鍵盤遮擋輸入框

https://github.com/flutter/flutter/issues/18564
https://juejin.cn/post/7000722125526925342

``` 
Scaffold(
      resizeToAvoidBottomInset: false,)

Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Despstion",
                    ),
                  )
              ),
```

##### 不支持空安全

https://blog.csdn.net/iOS_MingXing/article/details/123091081

https://stackoverflow.com/questions/64917744/cannot-run-with-sound-null-safety-because-dependencies-dont-support-null-safety

##### 輪播

`flutter_swiper`

``` 
class _SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:  Column(
        children: <Widget>[
          Container(
            child: AspectRatio(
              child: Swiper(
                itemBuilder: (BuildContext context,int index){
                  return new Image.network("https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b",fit: BoxFit.fill,);
                },
                itemCount: 3,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
              ),
              aspectRatio: 16/9,
            ),
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
```

##### Dialog

``` 
class _DialogPageState extends State<DialogPage> {
  _alertDialog() async {
    var res = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("this is alert dialog"),
            content: Text("你想好了嗎?"),
            actions: <Widget>[
              ElevatedButton(onPressed: () {
                print("取消");
                Navigator.pop(context,"Cancle"); // 這個會返回
              }, child: Text("取消")),
              ElevatedButton(onPressed: () {
                print("確定");
                Navigator.pop(context,"ok");    // 這個會返回
              }, child: Text("確定"))
            ],
          );
          // return Container(
          //   height: 100,
          //   color: Colors.green,
          // );
        },
    );

    print(res);
  }

  _simpleDialog() async {
    var res = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          alignment: Alignment.bottomCenter,
          title: Text("this is simple dialog"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Option A"),
              onPressed: () {

              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text("Option B"),
              onPressed: () {

              },
            ),
            Divider(),
            SimpleDialogOption(
              child: Text("Option C"),
              onPressed: () {

              },
            ),

              ElevatedButton(onPressed: () {
                print("取消");
                Navigator.pop(context,"Cancle"); // 這個會返回
              }, child: Text("取消")),
              ElevatedButton(onPressed: () {
                print("確定");
                Navigator.pop(context,"ok");    // 這個會返回
              }, child: Text("確定"))
          ],
        );
        // return Container(
        //   height: 100,
        //   color: Colors.green,
        // );
      },
    );

    print(res);
  }

  _modelBottomSheet() async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Option A"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Text("Option B"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Text("Option C"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Text("Option D"),
                  onTap: () {},
                ),
              ],
            ),
          );
        },
    );
  }

  _toast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dialog"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () {
              _alertDialog();
            }, child: Text("alert彈出框  AlertDialog")),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {_simpleDialog();}, child: Text("select彈出框  SimpleDialog")),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {_modelBottomSheet();}, child: Text("ActionSheet彈出框 showModalBottomSheet")),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {_toast();}, child: Text("toast-fluttertoast第三方庫")),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
  
```

自定義dialog

``` 
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

```

##### json

``` 
import 'dart:convert'; // json解析需要依賴

void main() {
  var mapData = {
    "name": "v1",
    "age": 20,
  };
  var strData = '{"name": "v2", "age": 20}';

  // MAP = > JSON
  print(json.encode(mapData));
  // JSON STR = > MAP
  print(json.decode(strData));
}
```


#### 设置沉浸式状态栏(Status Bar)

https://xuyisheng.top/flutter_uioverlay/

``` 
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main(){
  runApp(MyApp());

  if(Platform.isAndroid){
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      ///这是设置状态栏的图标和字体的颜色 
      ///Brightness.light  一般都是显示为白色
      ///Brightness.dark 一般都是显示为黑色
      statusBarIconBrightness: Brightness.light
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
```


#### APP 打包 Android

https://developer.aliyun.com/article/859389


找到keystore:  
``` 
X:\Program Files\Android\Android Studio\jre\bin
```

run: 

``` 
keytool -genkey -v -keystore X:\key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

genkey : 产生密钥
keystore ：
<存放的路径>/key.jks ：证书的存放路径和名字
keyalg RSA -keysize 2048 ：使用 2048 位 RSA 算法对签名加密
validity 10000 ：有效期时间，这里是 10000天
alias sign ： 别名 sign
```

打包:

``` 
flutter build apk
```

##### 關於 Flutter真机调试之后，安装新版本时提示:更新包与已安装应用签名不一致

https://www.jianshu.com/p/bfd40c6804c8

安装打包好的APP时提示：更新包与已安装应用签名不一致

``` 
命令行输入 adb --version
adb uninstall 你的包名

打开项目文件，找到android/app/src/main/kotlin下面的kt文件夹，里面的 第一行，package 后面的com.xxx.xxx，就是包名
```


##### 使用相機

拍照或獲取從相冊獲取圖片

image_picker

``` 
class _CameraAppState extends State<CameraApp> {
  File? image;
  // 相機
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      print(image.name);
      print(image.path);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  // 圖庫
  Future pickImage2() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      print(image.name);
      print(image.path);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  getImg() {
    if (this.image == null) {
      return Container();
    }
    return Container(
      child: Image.file(image!),
      height: 400,
      width: 400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                    pickImage2();
                  }
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Camera",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                    pickImage();
                  }
              ),
              getImg(),
            ],
          ),
        )
    );
  }
}
```

#### local_storage

``` 
class _LoginViewState extends State<LoginView> {
  var userName = new TextEditingController();
  var password = new TextEditingController();
  var jc = new TextEditingController();

  /// 设置Sting的值
  static setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  /// 获取返回为String的内容
  getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }

  _load() async {
    var jcv = await getString("jc");
    if (jcv != null) {
      setState(() {
        jc.text = jcv!;
      });
    }
  }

  @override
  void initState() {
      super.initState();
      Future.delayed(Duration.zero, () => setState(() {
        _load();
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: userName,
            decoration: InputDecoration(
              labelText: "UserName",
            ),
          ),
          Divider(),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          Divider(),
          TextField(
            controller: jc,
            decoration: InputDecoration(
              labelText: "JC",
            ),
          ),
          ElevatedButton(onPressed: () {
            setState(() {
              jc.text = userName.text + password.text;
              setString("jc", jc.text);
            });
          }, child: Text("Login")),
        ],
      ),
    );
  }
}
```

#### 二維碼識別

flutter_barcode_scanner

``` 
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', '返回', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = '获取平台版本失败.';
    }
    controller.setScanBarcode(barcodeScanRes) ;
  }
  
  Jiugongge(
              icon: Icons.qr_code,
              title: "在綫掃描商品",
              onTap: () {
                scanBarcodeNormal(); // 調用
              },
            ),
```

barcode_scan2: ^4.2.1

``` 
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    try {
      var result = await BarcodeScanner.scan();
      print(result.type); // The result type (barcode, cancelled, failed)
      print(result.rawContent); // The barcode content
      print(result.format); // The barcode format (as enum)
      print(result.formatNote); // If a unknown format was scanned this field contains a note
      controller.setScanBarcode(result.rawContent);
    }on PlatformException {
      print("errpr");
    }
  }
```

#### How to run Async ’await’ Code in initState() in Flutter App

https://www.fluttercampus.com/guide/63/how-to-run-async-await-code-in-initstate-flutter-app/

``` 
@override
void initState() {
  //you are not allowed to add async modifier to initState
  Future.delayed(Duration.zero,() async {
        //your async 'await' codes goes here
  });
  super.initState();
}
```

##### flutter单例模式

https://flutter.cn/community/tutorials/singleton-pattern-in-flutter-n-dart

``` 


class Singleton {
  static Singleton _instance;
  
  Singleton._internal();
  
  // 工厂构造函数
  factory Singleton() {
    if (_instance == null) {
      _instance = Singleton._internal();
    }
    
    return _instance;
  }
}

Dart 空安全及箭头函数等特性，那么还可以使用另一种方式进一步精简代码，写出像下面这样 Dart 风味十足的代码：

class Singleton {
  static Singleton _instance;

  Singleton._internal() {
    _instance = this;
  }

  factory Singleton() => _instance ?? Singleton._internal();
}

懒加载: 

class Singleton {
  Singleton._internal();
  
  factory Singleton() => _instance;
  
  static late final Singleton _instance = Singleton._internal();
}
```

GETX:

https://www.liujunmin.com/flutter/getx/getx_controller.html


#### Navigator2

#### 預初始化

``` 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HiCache>(
        future: () async {
          return await HiCache.preInit();
        }(),
        builder: (BuildContext context, AsyncSnapshot<HiCache> snapshot) {
      var widget = snapshot.connectionState == ConnectionState.done ?
          Router(routerDelegate: _routerDelegate):
          Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
      return MaterialApp(
        home: widget,
        theme: ThemeData(primarySwatch: white),
      );
    });
  }
```

#### 基於PageView 來實現 帶有bottomNavigationBar的首頁

PageView 在來回切換的時候 會被重新創建 

``` 
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          RankingPage(),
          FavoritePage(),
          ProfilePage(),
        ],
        onPageChanged: (index)=>_onJumpTo(index,pageChange: true),
        physics: NeverScrollableScrollPhysics(), // 禁止滾動
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index)=>_onJumpTo(index),
        selectedItemColor: _activeColor,
        items: [
          _bottomItem('Home', Icons.home, 0),
          _bottomItem('Ranking', Icons.align_vertical_top, 1),
          _bottomItem('Favorite', Icons.favorite, 2),
          _bottomItem('Profile', Icons.park_rounded, 3),
        ],
      ),
    );
  }
```


PageView 在來回切換的時候 會被重新創建

下面的HomePage 會重新創建再調用 initState 方法
``` 
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late RouteChangeListener listener;

  @override
  void initState() {
    print("init");
    super.initState();
```

如果PageView中的頁面要實現 持久的效果: 

需要 `with AutomaticKeepAliveClientMixin ` 并且 重寫 `wantKeepAlive` 方法

``` 
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;
}

```


#### Tab

``` 
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late RouteChangeListener listener;
  var tabs = ["推薦", "熱門", "追番", "影視", "搞笑", "日常", "綜合", "手機游戲"];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // tabController 需要 with TickerProviderStateMixin
    _tabController = TabController(
      length: tabs.length, vsync: this,
    );

    HiNavigator.getInstance().addListener(listener = (current, pre) {
      print('current: ${current.page}');
      print('pre: ${pre?.page}');

      if (current.page == widget || current is HomePage) {
        print("打開首頁了: onResume");
      } else if (widget == pre?.page || pre?.page is HomePage) {
        print("打開首頁了: onPause");
      }
    });
  }

  @override
  void dispose() {
    HiNavigator.getInstance().removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 30),
              child: _tabBar(),
          ),
          Flexible(child: TabBarView(
            controller: _tabController,
            children: tabs.map((e) {
              return HomeTabPage(name: e);
            }).toList(),
          ))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _tabBar() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      // 是否可以滾動
      labelColor: Colors.black,
      indicator: UnderlineIndicator(
        strokeCap: StrokeCap.round,
        borderSide: BorderSide(color: primary, width: 3),
        insets: EdgeInsets.only(left: 15, right: 15),
      ),
      // 圓角指示器
      tabs: tabs.map<Tab>((tab) {
        return Tab(child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Text(tab, style: TextStyle(
            fontSize: 16,
          ),),
        ));
      }).toList(),
    );
  }
}
```


### 本地生物識別

``` 
依賴:   local_auth: ^2.1.2

修改1: app/src/main/AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.auth_test">

// 天下下面兩個
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.USE_FINGERPRINT"/>


修改2: app/src/main/kotlin/com/example/xxxxProjectNamexxxx/MainActivity.kt
package com.example.auth_test

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }
}

使用:
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
          ? _SupportState.supported
          : _SupportState.unsupported),
    );
  }


檢查是否有生物識別功能:

    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }
    
調用生物識別:  
bool authenticated = false;  
try {

  // 調用生物識別
  authenticated = await auth.authenticate(
    localizedReason:
    '扫描您的指纹（或面部或其他）以进行身份验证',  // 識別描述
    options: const AuthenticationOptions(
      stickyAuth: true,
      biometricOnly: true,
    ),
  );

  setState(() {
    _isAuthenticating = false;
    _authorized = 'Authenticating2';
  });
} on PlatformException catch (e) {
  print(e);
  setState(() {
    _isAuthenticating = false;
    _authorized = 'Error - ${e.message}';
  });
  return;
}
if (!mounted) {
  return;
}
```


#### Gradle 配置代理

配置位置 `X:\Users\計算機用戶\.gradle`

文件名: `gradle.properties`

```  
System.setProperty(“socksProxyHost”,“127.0.0.1”)
System.setProperty(“socksProxyPort”,“1081”)
```

#### 下拉刷新：

``` 
    return RefreshIndicator(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: _showB(),
          ),
          color: primary,  // 指示器顔色
          onRefresh: _loadData);
```

##### lottie

https://lottiefiles.com/

