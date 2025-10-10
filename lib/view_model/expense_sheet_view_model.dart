import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spent/repository/backend/local_db.dart';
import 'package:spent/src/config.dart';
import 'package:spent/src/model.dart';
import 'package:spent/utils/utils.dart';

final expenseSheetViewModel = ChangeNotifierProvider((ref) => ExpenseSheetViewModel(ref));

class ExpenseSheetViewModel with ChangeNotifier {
  Ref ref;
  ExpenseSheetViewModel(this.ref);
  final List<ExpenseSheet> _expenseSheets = [];
  List<ExpenseSheet> get expenseSheets => _expenseSheets;

  ///Formats the total amount of an expense sheet.
  void formatASheetsTotalAmount(String amount) {
    amount = Utils.formatPrice(int.parse(amount));
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
          .putAnExpenseSheet(
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
}
