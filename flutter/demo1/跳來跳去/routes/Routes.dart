import 'package:flutter/material.dart';
import 'package:helloworld/pages/From.dart';
import 'package:helloworld/pages/Search.dart';
import '../pages/Tabls.dart';
import '../pages/Product.dart';
import '../pages/user/Login.dart';
import '../pages/user/Register.dart';
import '../pages/user/RegisterSecond.dart';

final routes = {
  '/home': (context) => Tabls(),
  '/form': (context, {arguments}) => FromPage(arguments: arguments),
  '/search': (context) => SearchPage(),
  '/product': (context, {arguments}) => ProductPage(arguments: arguments),
  // '/product': (context) => ProductPage()
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
  '/register_second': (context) => RegisterSecondPage(),
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
