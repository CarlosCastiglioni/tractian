import 'package:flutter/material.dart';
import 'package:tractian/styles/app_colors.dart';
import 'package:tractian/styles/app_text_styles.dart';

class AppAppbarTheme extends AppBarTheme {
  const AppAppbarTheme()
      : super(
            iconTheme: const IconThemeData(size: 20),
            backgroundColor: AppColors.darkBlue,
            titleTextStyle: AppTextStyles.appBar,
            centerTitle: true,
            elevation: 0);
}
