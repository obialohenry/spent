import 'package:flutter/material.dart';
import 'package:spent/src/config.dart';

class ColoredTexts extends StatelessWidget {
  ///Creates a widget displaying two texts with different colour.
  const ColoredTexts({super.key, required this.trailingText, required this.leadingText});

  final String trailingText;
  final String leadingText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: trailingText,
            style: TextStyle(
              fontFamily: SpentStrings.inter,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: SpentColors.kTextBlack,
            ),
          ),
        ],
        text: '$leadingText: ',
        style: TextStyle(
          fontFamily: SpentStrings.inter,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: SpentColors.kTextBlack,
        ),
      ),
    );
  }
}