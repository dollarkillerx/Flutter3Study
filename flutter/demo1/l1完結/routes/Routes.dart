import 'package:flutter/material.dart';
import 'package:helloworld/pages/CheckBox.dart';
import 'package:helloworld/pages/From.dart';
import 'package:helloworld/pages/Redio.dart';
import 'package:helloworld/pages/Search.dart';
import 'package:helloworld/pages/TextField.dart';
import '../pages/DataPicker.dart';
import '../pages/DataPicker2.dart';
import '../pages/FormDemo.dart';
import '../pages/Http.dart';
import '../pages/Swiper.dart';
import '../pages/Tabls.dart';
import '../pages/Product.dart';
import '../pages/dialog.dart';
import '../pages/user/Login.dart';
import '../pages/user/Register.dart';
import '../pages/user/RegisterSecond.dart';
import '../pages/AppBarDemo.dart';

final routes = {
  '/home': (context) => Tabls(),
  '/form': (context, {arguments}) => FromPage(arguments: arguments),
  '/search': (context) => SearchPage(),
  '/product': (context, {arguments}) => ProductPage(arguments: arguments),
  // '/product': (context) => ProductPage()
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
  '/register_second': (context) => RegisterSecondPage(),
  '/appBarDemo': (context) => AppBarDemoPage(),
  '/text_field': (context) => TextFieldPage(),
  '/radio': (context) => RedioPage(),
  '/check_box': (context) => CheckBoxPage(),
  '/form_demo': (context) => FormDemoPage(),
  '/datapick': (context) => DataPickerPage(),
  '/datapick2': (context) => DataPickerPage2(),
  '/swiperPage': (context) => SwiperPage(),
  '/dialogPage': (context) => DialogPage(),
  '/HTTPPage': (context) => HTTPPage(),
};

var onGenerateRoute = (RouteSettings settings) {
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
};
