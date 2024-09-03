import 'package:flutter/material.dart';
import 'package:tractian/widgets/app_appbar.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppbar(
        title: 'Assets',
      ),
    );
  }
}
