import 'package:flutter/material.dart';
import 'package:tractian/styles/app_images.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const AppAppbar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(title: title != null ? Text(title!) : Image.asset(AppImages.logo));
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
