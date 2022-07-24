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

class MyButton extends StatelessWidget {
  String text;

  MyButton(this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.text),
      onPressed: () { },
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

class News extends StatelessWidget {
  String img;
  String text;

  News(this.img, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // child: Image.network(this.img,fit: BoxFit.fill),
      child: Stack(
        children: [
          Image.network(
            this.img,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              this.text,
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
