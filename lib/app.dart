import 'package:flutter/material.dart';
import 'package:tractian/app_router.dart';
import 'package:tractian/themes/app_appbar_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppAppbarTheme(),
      ),
      title: "tractian",
      debugShowCheckedModeBanner: false,
      routes: AppRouter.list,
      initialRoute: AppRouter.initial,
      navigatorKey: AppRouter.navigatorKey,
    );
  }
}
