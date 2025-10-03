import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spent/src/model.dart';

final expenseSheetViewModel = ChangeNotifierProvider((ref) => ExpenseSheetViewModel());

class ExpenseSheetViewModel with ChangeNotifier {
  List<ExpenseSheet> _expenseSheets = [];
  List<ExpenseSheet> get expenseSheets => _expenseSheets;
}
