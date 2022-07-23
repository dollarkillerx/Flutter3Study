// main() {
//   print("hello world");
// }

import './lib/sql.dart';

void main() {
  // var str = 'hello dart';
  // int age = 12;
  // var pAge = 13;
  //
  // const name = "xxx";
  // final pName;
  // pName = "jc";
  //
  // final now = new DateTime.now();
  // print(now);
  //
  // print("hello world");
  
  
  testString();
  testNumber();
  testList();
  testMap();
  print(printUserInfo("username"));

  testPerson();
  testT();
}

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