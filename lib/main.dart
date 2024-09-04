import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian/app.dart';
import 'package:tractian/modules/assets_module/assets_controller.dart';
import 'package:tractian/modules/home_module/home_controller.dart';
import 'package:tractian/repositories/assets_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      Provider<AssetsRepository>(create: (context) => AssetsRepository()),
      ChangeNotifierProvider<HomeController>(
          create: (context) =>
              HomeController(assetsRepository: context.read<AssetsRepository>())),
      ChangeNotifierProvider<AssetsController>(
          create: (context) =>
              AssetsController(assetsRepository: context.read<AssetsRepository>())),
    ],
    child: const App(),
  ));
}
