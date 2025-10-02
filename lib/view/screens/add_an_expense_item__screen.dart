import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';

class AddAnExpenseItemScreen extends StatefulWidget {
  const AddAnExpenseItemScreen({super.key});

  @override
  State<AddAnExpenseItemScreen> createState() => _AddAnExpenseItemScreenState();
}

class _AddAnExpenseItemScreenState extends State<AddAnExpenseItemScreen> {
  final TextEditingController _amountSpentController = TextEditingController();
  final TextEditingController _expenseNameController = TextEditingController();
  @override
  void dispose() {
    _amountSpentController.dispose();
    _expenseNameController.dispose();
    super.dispose();
  }
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
            SpentTextField(controller: _expenseNameController, hint: SpentStrings.hintExpenseName),
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
