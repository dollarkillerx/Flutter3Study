import 'package:flutter/material.dart';
import 'package:helloworld/pages/Tabls.dart';
import 'routes/Routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 關閉debug 圖標
      home: Tabls(),
      initialRoute: "/HTTPPage",
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
