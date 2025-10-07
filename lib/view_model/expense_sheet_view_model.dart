import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spent/repository/backend/local_db.dart';
import 'package:spent/src/model.dart';
import 'package:spent/src/screens.dart';
import 'package:spent/utils/utils.dart';

final expenseSheetViewModel = ChangeNotifierProvider((ref) => ExpenseSheetViewModel(ref));

class ExpenseSheetViewModel with ChangeNotifier {
  Ref ref;
  ExpenseSheetViewModel(this.ref);
  List<ExpenseSheet> _expenseSheets = [];
  List<ExpenseSheet> get expenseSheets => _expenseSheets;
 
  ///
  void formatASheetsTotalAmount(String amount) {
    amount = Utils.formatPrice(int.parse(amount));
    notifyListeners();
  }

  ///
  Future<void> createExpenseSheet(
    BuildContext context, {
    required String id,
    required String sheetName,
    required String totalAmount,
  }) async {
    try {
      final dateTime = DateTime.now();
      await ref
          .read(spentLocalDb)
          .putAnExpenseSheet(
            id: id,
            title: sheetName,
            totalAmount: int.parse(totalAmount),
            dateCreated: dateTime,
            amountRemaining: 0,
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
      Navigator.push(context, MaterialPageRoute(builder: (_) => AnExpenseSheetDetailsScreen()));
    } catch (e, s) {
      print(
        "👀 Error Occured\nYou will probably find the error here..\n$s\nThe error itself.. \n$e",
      );
    }
  }
}
