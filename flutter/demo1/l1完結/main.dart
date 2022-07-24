import 'package:flutter/material.dart';
import 'package:helloworld/pages/Tabls.dart';
import 'routes/Routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'dart:io';
import 'package:flutter/services.dart';

void main() {
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 關閉debug 圖標
      home: Tabls(),
      // initialRoute: "/HTTPPage",
      onGenerateRoute: onGenerateRoute, // 沒有router才會執行 onGenerateRoute
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
