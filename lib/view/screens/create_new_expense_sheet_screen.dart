import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/utils/utils.dart';
import 'package:spent/view_model/expense_sheet_and_items_view_model.dart';
import 'package:uuid/uuid.dart';

class CreateNewExpenseSheetScreen extends ConsumerStatefulWidget {
  const CreateNewExpenseSheetScreen({super.key});

  @override
  ConsumerState<CreateNewExpenseSheetScreen> createState() => _CreateNewExpenseSheetScreenState();
}

class _CreateNewExpenseSheetScreenState extends ConsumerState<CreateNewExpenseSheetScreen> {
  final TextEditingController _sheetNameController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final _createNewExSheetFormKey = GlobalKey<FormState>();
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
            Form(
              key: _createNewExSheetFormKey,
              child: Column(
                children: [
                  SpentTextField(
                    controller: _sheetNameController,
                    hint: SpentStrings.hintSheetName,
                    validator: (value) => Utils.validateEmptyTextField(value),
                  ),
                  Gap(16),
                  SpentTextField(
                    controller: _totalAmountController,
                    hint: SpentStrings.hintTotalAmount,
                    keyboardType: TextInputType.number,
                    onChanged: (amount) {
                      ref
                          .read(expenseSheetAndItemsViewModel)
                          .formatASheetsTotalAmount(_totalAmountController, amount);
                    },
                    validator: (value) => Utils.validateEmptyTextField(value),
                  ),
                ],
              ),
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
                    onPressed: () async {
                      if (_createNewExSheetFormKey.currentState!.validate()) {
                        _createNewExSheetFormKey.currentState!.save();
                        final uuid = Uuid().v4();
                        await ref
                            .read(expenseSheetAndItemsViewModel)
                            .createExpenseSheet(
                              context,
                              id: uuid,
                              sheetName: _sheetNameController.text,
                              totalAmount: _totalAmountController.text.replaceAll(',', ''),
                            );
                      }
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
