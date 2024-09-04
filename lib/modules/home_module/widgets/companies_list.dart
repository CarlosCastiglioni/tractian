import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian/models/company.dart';
import 'package:tractian/modules/home_module/home_controller.dart';
import 'package:tractian/modules/home_module/widgets/company_box.dart';

class CompaniesList extends StatefulWidget {
  const CompaniesList({super.key});

  @override
  State<CompaniesList> createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  @override
  void initState() {
    Provider.of<HomeController>(context, listen: false).getAllCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            for (Company company in homeController.companies)
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CompanyBox(company: company))
          ],
        ),
      ),
    );
  }
}
