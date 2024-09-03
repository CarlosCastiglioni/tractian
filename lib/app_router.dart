import 'package:flutter/material.dart';
import 'package:tractian/modules/home_module/home_page.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> list = <String, WidgetBuilder>{
    "/home": (context) => const HomePage(),
  };

  static String initial = '/home';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
