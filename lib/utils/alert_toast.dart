import 'package:bot_toast/bot_toast.dart';
import 'package:spent/src/components.dart';
import 'package:flutter/material.dart';
import 'package:spent/src/config.dart';

/// Displays a temporary toast notification at the bottom center of the screen.
void showToast({required String msg,bool isDeleteMsgToast = false,VoidCallback? onTapUndo}) {
  Duration toastDuration = const Duration(seconds: 3);

  BotToast.showCustomNotification(
    toastBuilder: (cancelFunc) {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: SpentColors.kDeepCharcoal,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextView(text: msg, color: SpentColors.kWhite, fontWeight: FontWeight.w500),
                Visibility(visible: isDeleteMsgToast,child: TextView(onTap: onTapUndo,text: SpentStrings.msgUndo,color: SpentColors.kWhite, fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                ))
              ],
            ),
            IconButton(onPressed: () {
              
            },icon:Icon(Icons.close),color: SpentColors.kWhite,)
          ],
        ),
      );
    },
    align: Alignment.bottomCenter,
    duration: toastDuration,
    animationDuration: const Duration(milliseconds: 300),
    animationReverseDuration: const Duration(milliseconds: 200),
  );
}