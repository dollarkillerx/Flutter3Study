# Dart 基礎語法

``` 
void main() {
  var str = 'hello dart';
  int age = 12;
  var pAge = 13;

  print("hello world");
}

const name = "xxx";
final pName;  // 只能賦值一次
pName = "jc";
```

### 基礎類型：

``` 
void testString() {
  String h1 = "Hello";
  String h2 = "World";
  print(h1 + " " + h2);
  print(h1.isEmpty);

  var pt = "A1-A2-A3";
  var ptList = pt.split('-');
  print(ptList is List);
  print(ptList);
}

void testNumber() {
  // int
  int a = 123;
  double b = 232.232;

  var p = "123.55";
  b = double.parse(p);
  print(b);
  print(b.isNaN);
}

void testList() {
  var l1 = ["三張"];
  var l2 = <String> ["三張"];
  for (int i=0;i<10;i++) {
    l1.add("this is $i");
  }
  print(l1);

  for (var v in l1) {
    print(v);
  }

  var l3 = List.filled(2, ""); // 創建一個固定長度的集合
  print(l3);
}

void testMap() {
  print("Test Map....");
  var person = {
    "name": "張三",
    "age": 20
  };

  print(person);
  print(person["name"]);

  print(person.keys.toList());

  person.remove("name");
  print(person["name"]);

  var p = new Map<String,int>();
}
```

### class oject

``` 
String printUserInfo(String username,[int? age, String sex = 'おとこ']) {
  return "$username + $age + $sex";
}

bool isEvenNumber(int n) {
  if (n%2==0) {
    return true;
  }

  return false;
}

class Person {
  late String name;
  int age =23;
  
  static HelloWorld() {
    print("hello world");
  }

  Person(this.name,this.age);
  // Person(String name, int age) {
  //     this.name = name;
  //     this.age = age;
  // }

  // 私有
  void _xn() {
    print("xn");
  }

  void getInfo() {
    print("${this.name}  ==  ${this.age}");
  }

}

class Px extends Person {
  // 實現父類的構造方法
  Px(String name, int age) : super(name, age);
}

void testPerson() {
  Person dollar = new Person("name", 11);
  dollar.getInfo();
  dollar._xn();

  Person.HelloWorld();
  
  Db mySql = new MySQL();
  mySql.Init("xxxx");
}

// 類似與interface
abstract class Animal {
  eat();
}

class Dog extends Animal {
  @override
  eat() {
    print("eat");
  }
}

class Cat implements Animal {
  @override
  eat() {
    // TODO: implement eat
    throw UnimplementedError();
  }
}

abstract class Db {
  Init(String uri);
  Query();
  Exec();
}

class MySQL implements Db {
  late String uri;

  @override
  Init(String uri) {
    this.uri = uri;
  }

  @override
  Exec() {
    print("exec");
  }

  @override
  Query() {
    print("query");
  }

}


// 實現多個接口
abstract class A {
  late String name;
  void printA();
}

abstract class B {
  late String name;
  void printB();
}

class Ab implements A,B {
  @override
  late String name;

  @override
  void printA() {
    // TODO: implement printA
  }

  @override
  void printB() {
    // TODO: implement printB
  }
  
}
```

mixins 實現類似 多繼承：

``` 
class A {
  late String name;
  void printA() {
    print("av");
  }
}

class B {
  late String name;
  void printB() {
    print("av");
  }
}

class Ab with A,B {}
```

范形：

``` 
T getDate<T>(T value) {
  return value;
}

class MyList<T> {
  List list = <T>[];
  void add(T value) {
    this.list.add(value);
  }
  List getList(){
    return this.list;
  }
}

void testT() {
  print(getDate("value"));
  print(getDate<String>("value"));

  MyList ls = new MyList();
  MyList ls2 = new MyList<int>();
  ls.add(1);
  ls.add(2);
  print(ls.getList());
}
```

##### List 

垂直列表: 
``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    for (var i = 0; i < 10; i++) {
      list.add(ListTile(
        leading: Image.network(
            "https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b"),
        // https://fonts.google.com/icons?selected=Material+Icons
        // leading: Icon(Icons.home,color: Colors.green,), // 圖標前置
        trailing: Icon(Icons.join_left_outlined), // 圖標後置
        title: Text("東北大平原",
            style: TextStyle(
              fontSize: 18,
            )),
        subtitle:
            Text("牛高馬大 空氣清新,牛高馬大 空氣清新,牛高馬大 空氣清新,牛高馬大 空氣清新,牛高馬大 空氣清新,牛高馬大 空氣清新"),
      ));
      list.add(Image.network(
          "https://picx.zhimg.com/v2-bdb878e47afa95e71f681a362edde08c_1440w.jpg?source=172ae18b"));
    }

    return ListView(
      padding: EdgeInsets.all(6),
      children: <Widget>[
        ...list,
      ],
    );
  }
}
```

水平列表: 

``` 
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    for (var i = 0; i < 10; i++) {
      list.add(Container(
        height: 180,
        width: 180,
        color: i%2>0?Colors.amber: Colors.green,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("噶沙司"),
              subtitle: Text("this is body")
            )
          ],
        ),
        // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      ));
    }

    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal, // horizontal 水平列表 vertical 垂直列表 默認
        children: <Widget>[
          ...list,
        ],
      ),
      height: 180,
    );
  }
}
```