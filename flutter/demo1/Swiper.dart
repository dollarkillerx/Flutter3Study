import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  String title = "this is title";

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

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
