import 'package:flutter/material.dart';
import 'package:tractian/models/company.dart';
import 'package:tractian/styles/app_colors.dart';
import 'package:tractian/styles/app_images.dart';
import 'package:tractian/styles/app_text_styles.dart';

class CompanyBox extends StatelessWidget {
  final Company company;
  const CompanyBox({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/assets", arguments: company.id);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: AppColors.blue,
        ),
        height: 76,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Image.asset(AppImages.company),
              const SizedBox(width: 10),
              Text(
                company.name,
                style: AppTextStyles.companyButtonText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
