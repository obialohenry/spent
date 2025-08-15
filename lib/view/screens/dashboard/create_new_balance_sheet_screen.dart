import 'package:flutter/material.dart';
import 'package:spent/src/config.dart';
import 'package:spent/view/components/app_bar.dart';

class CreateNewBalanceSheetScreen extends StatefulWidget {
  const CreateNewBalanceSheetScreen({super.key});

  @override
  State<CreateNewBalanceSheetScreen> createState() => _CreateNewBalanceSheetScreenState();
}

class _CreateNewBalanceSheetScreenState extends State<CreateNewBalanceSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpentColors.kIvoryWhite,
      appBar: SpentAppBar.mainAppBar(context, title: SpentStrings.hdrCeateNewBalanceSheet),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Column(children: [
                
              ],
            )],
        ),
      ),
    );
  }
}
