import 'package:flutter/material.dart';
import 'package:tractian/models/company.dart';
import 'package:tractian/repositories/assets_repository.dart';

class HomeController extends ChangeNotifier {
  final AssetsRepository assetsRepository;
  List<Company> companies = [];

  HomeController({required this.assetsRepository});

  Future getAllCompanies() async {
    companies = await assetsRepository.getAllCompanies();
    notifyListeners();
  }
}
