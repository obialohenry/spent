import 'package:flutter/material.dart';
import 'package:spent/src/config.dart';
import 'package:spent/view/components/custom_texts.dart';

class EmptyItemsFeedbackMessage extends StatelessWidget {
  ///Creates a widget displaying a container with border, and a centered text [message] inside.
  const EmptyItemsFeedbackMessage({super.key, required this.message,this.height,this.width});
  final double? height;
  final double? width;
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? 50,
      width: width??200,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: SpentColors.kIvoryWhite,
        border: Border.all(color: SpentColors.kPearlAsh),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextView(text: message!, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}
