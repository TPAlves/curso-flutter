import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color? colorNameGreenTitle;
  final Color? colorNameGrocerTitle;
  final double fontSizeTitle;

  const AppNameWidget({
    super.key,
    this.colorNameGreenTitle,
    this.colorNameGrocerTitle,
    this.fontSizeTitle = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(fontSize: fontSizeTitle),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              color: colorNameGreenTitle ?? CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(
              color: colorNameGrocerTitle ?? Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
