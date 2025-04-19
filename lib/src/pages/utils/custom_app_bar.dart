import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [],
      backgroundColor: CustomColors.backgroundLogin,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
