import 'package:flutter/material.dart';
import 'package:tractian/modules/home_module/components/companies_list.dart';
import 'package:tractian/widgets/app_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppbar(),
      body: CompaniesList(),
    );
  }
}
