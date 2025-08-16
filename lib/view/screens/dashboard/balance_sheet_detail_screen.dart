import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/src/screens.dart';

class BalanceSheetDetailScreen extends StatelessWidget {
  const BalanceSheetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpentColors.kIvoryWhite,
      appBar: SpentAppBar.mainAppBar(context, title: ""),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Sub header.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: '${SpentStrings.tipCreated}: Aug 3',
                      fontSize: 10,
                      color: SpentColors.kFrostedSteel,
                    ),
                    TextView(text: '₦ 45,000', fontSize: 12, color: SpentColors.kPrimary),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddExpenseScreen()));
        },
        child: ShimmerSlide(
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: SpentColors.kPrimary, shape: BoxShape.circle),
            child: Center(
              child: Icon(Icons.arrow_upward_outlined, color: SpentColors.kIvoryWhite, size: 25),
            ),
          ),
        ),
      ),
    );
  }
}
