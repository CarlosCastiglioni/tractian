import 'package:flutter/material.dart';
import 'package:tractian/styles/app_colors.dart';
import 'package:tractian/styles/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final String? image;
  final bool pressedButton;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.pressedButton,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: pressedButton ? AppColors.blue : AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            children: [
              if (image != null)
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Image.asset(image!),
                ),
              Text(
                title,
                style: pressedButton
                    ? AppTextStyles.filterButtonWhite
                    : AppTextStyles.filterButtonGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
