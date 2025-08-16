import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/view/screens/dashboard/balance_sheet_detail_screen.dart';

class CreateNewBalanceSheetScreen extends StatefulWidget {
  const CreateNewBalanceSheetScreen({super.key});

  @override
  State<CreateNewBalanceSheetScreen> createState() => _CreateNewBalanceSheetScreenState();
}

class _CreateNewBalanceSheetScreenState extends State<CreateNewBalanceSheetScreen> {
  final TextEditingController _sheetNameController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  @override
  void dispose() {
    _sheetNameController.dispose();
    _totalAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpentColors.kIvoryWhite,
      appBar: SpentAppBar.mainAppBar(
        context,
        title: SpentStrings.hdrCeateNewBalanceSheet,
        isCreateNewBlnceShtScrn: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SpentTextField(controller: _sheetNameController, hint: SpentStrings.hintSheetName),
                Gap(16),
                SpentTextField(
                  controller: _totalAmountController,
                  hint: SpentStrings.hintTotalAmount,
                ),
              ],
            ),
            Column(
              children: [
                ShimmerSlide(
                  child: SpentButtonMain(
                    text: SpentStrings.btnSave,
                    borderRadius: 8,
                    color: SpentColors.kPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      //TODO:create new balance sheet.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => BalanceSheetDetailScreen()),
                      );
                    },
                  ),
                ),
                Gap(16),
                SpentButtonMain(
                  text: SpentStrings.btnCancel,
                  borderRadius: 8,
                  borderColor: SpentColors.kBrightRed,
                  textColor: SpentColors.kBrightRed,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
