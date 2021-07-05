import 'package:flutter/material.dart';
import 'package:market_easy/src/screen/home.dart';
import 'package:market_easy/src/screen/login.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => Login());
        break;
      case "/home":
        return MaterialPageRoute(builder: (context) => Home());
        break;
      default:
        return MaterialPageRoute(builder: (context) => Login());
    }
  }
}
