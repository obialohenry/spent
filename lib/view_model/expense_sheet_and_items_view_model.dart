import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spent/repository/backend/local_db.dart';
import 'package:spent/src/config.dart';
import 'package:spent/src/model.dart';
import 'package:spent/utils/alert_toast.dart';
import 'package:spent/utils/utils.dart';

final expenseSheetAndItemsViewModel = ChangeNotifierProvider(
  (ref) => ExpenseSheetAndItemsViewModel(ref),
);

class ExpenseSheetAndItemsViewModel with ChangeNotifier {
  Ref ref;
  ExpenseSheetAndItemsViewModel(this.ref);
  List<ExpenseSheet> _expenseSheets = [];
  List<ExpenseSheet> get expenseSheets => _expenseSheets;

  ///Formats the total amount of an expense sheet.
  void formatASheetsTotalAmount(TextEditingController amount, String? value) {
    if (value == null) return;
    amount.text = Utils.formatPrice(int.parse(value.replaceAll(',', '')));
    notifyListeners();
  }

  ///Creates an expense sheet
  ///
  ///Takes in the following parameters [id,sheetName,totalAmount] of value string.
  ///Using`id` as unique identifier, It creates and stores an expense sheet locally.
  ///Navigates back to the expense sheet screen, displaying a summary card of the
  ///just created expense sheet on the screen.
  Future<void> createExpenseSheet(
    BuildContext context, {
    required String id,
    required String sheetName,
    required String totalAmount,
  }) async {
    try {
      final dateTime = DateTime.now(); //Fetch the exact date and time in that moment.
      await ref
          .read(spentLocalDb)
          .saveExpenseSheet(
            id: id,
            title: sheetName,
            totalAmount: int.parse(totalAmount),
            dateCreated: dateTime,
            amountRemaining: 0, //No expense item have been added to this sheet.
          );
      _expenseSheets.add(
        ExpenseSheet(
          id: id,
          title: sheetName,
          totalAmount: int.parse(totalAmount),
          dateCreated: dateTime,
          amountRemaining: 0,
        ),
      );
      notifyListeners();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (e, s) {
      print(
        "👀 ${SpentStrings.errErrorOccured}\n${SpentStrings.errYouWillFindItHere}\n$s\n${SpentStrings.errTheErrorItself} \n$e",
      );
    }
  }

  Future<void> deleteExpenseSheet({required int index, required String id}) async {
    try {
      await ref.read(spentLocalDb).deleteExpenseSheet(id);
      _expenseSheets.removeAt(index);
      notifyListeners();
      showToast(msg: SpentStrings.msgExpenseSheetDeleted, isDeleteMsgToast: true, onTapUndo: () {});
    } catch (e, s) {
      print(
        "👀 ${SpentStrings.errErrorOccured}\n${SpentStrings.errYouWillFindItHere}\n$s\n${SpentStrings.errTheErrorItself} \n$e",
      );
    }
  }

  Future<void> getExpenseSheets() async {
    try {
      final data = await ref.read(spentLocalDb).getExpenseSheets();
      if (data.isEmpty) {
        _expenseSheets;
      } else {
        List<Map<String, dynamic>> expenseSheetsJson = data.values.toList();
        _expenseSheets = expenseSheetsJson.map((json) => ExpenseSheet.fromJson(json)).toList();
      }
    } catch (e, s) {
      print(
        "👀 ${SpentStrings.errErrorOccured}\n${SpentStrings.errYouWillFindItHere}\n$s\n${SpentStrings.errTheErrorItself} \n$e",
      );
    }
  }
}
