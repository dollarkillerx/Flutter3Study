import 'package:flutter/material.dart';
import 'package:helloworld/pages/Tabls.dart';
import 'routes/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabls(),
      onGenerateRoute: onGenerateRoute, // 沒有router才會執行 onGenerateRoute
    );
  }
}
