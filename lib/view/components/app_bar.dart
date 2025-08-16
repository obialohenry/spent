import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';

class SpentAppBar {
  ///Create a widget displaying a back icon and a text title underneath.
  static PreferredSizeWidget mainAppBar(BuildContext context,{required String title}) {
    return PreferredSize(
      preferredSize: Size(0, 130),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: SpentColors.kTextBlack, size: 25),
              ),
              Gap(8),
              TextView(text: title, fontSize: 28, fontWeight: FontWeight.bold, maxLines: 2),
            ],
          ),
        ),
      ),
    );
  }
}
