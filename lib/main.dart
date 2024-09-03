import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian/app.dart';
import 'package:tractian/modules/home_module/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      Provider<HomeController>(create: (context) => HomeController()),
    ],
    child: const App(),
  ));
}
