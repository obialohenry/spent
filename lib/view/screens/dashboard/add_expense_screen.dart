import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController _amountSpentController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  @override
  void dispose() {
    _amountSpentController.dispose();
    _noteController.dispose();
    super.dispose();
  }
  //TODO:Implement adding an expense of type ExpenseModel to an expense sheet.
  //TODO:Save to localdb.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpentColors.kIvoryWhite,
      appBar: SpentAppBar.mainAppBar(context, title: SpentStrings.hdrAddExpense),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            SpentTextField(controller: _amountSpentController, hint: SpentStrings.hintAmountSpent),
            Gap(16),
            SpentTextField(controller: _noteController, hint: SpentStrings.hintNote),
            Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ShimmerSlide(
                    child: SpentButtonMain(
                      text: SpentStrings.btnSave,
                      color: SpentColors.kPrimary,
                      borderRadius: 8,
                      fontSize: 16,
                      width: 167,
                      fontWeight: FontWeight.w600,
                      onPressed: () {
                        //TODO:save an expense.
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Gap(10),
                Expanded(
                  child: SpentButtonMain(
                    text: SpentStrings.btnCancel,
                    borderRadius: 8,
                    borderColor: SpentColors.kBrightRed,
                    textColor: SpentColors.kBrightRed,
                    fontSize: 16,
                    width: 167,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
