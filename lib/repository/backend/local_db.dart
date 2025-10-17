import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spent/model/local/dummy_data.dart';

final spentLocalDb = ChangeNotifierProvider((ref) => SpentLocalDb(ref));

class SpentLocalDb with ChangeNotifier {
  late final BoxCollection _collection;
  late final CollectionBox<Map<String, dynamic>> _expenseSheetBox;
  late final CollectionBox<bool> _userDetsBox;

  Ref ref;
  SpentLocalDb(this.ref);

  /// Create a box collection
  Future<void> init() async {
    final appDir = await getApplicationDocumentsDirectory();
    _collection = await BoxCollection.open(
      'SpentAppBox', // Name of your database
      {'expenseSheets', 'expenses', "userFirstTimeOnapp"}, // Names of your boxes
      path: appDir.path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );
    // Open your boxes.
    _expenseSheetBox = await _collection.openBox<Map<String, dynamic>>('expenseSheets');
    _userDetsBox = await _collection.openBox<bool>("userFirstTimeOnapp");
  }

  Future<void> addUsersFirstTimeOnAppToDbAsFalse() async {
    await _userDetsBox.put('firstTimeOnApp', false);
  }

  Future<void> getFirstTimeOnAppStatus() async {
    await init();
    DummyData.firstTimeOnApp = await _userDetsBox.get("firstTimeOnApp") ?? true;
    print("👀 First time on app? ${DummyData.firstTimeOnApp}");
  }

  Future<void> saveExpenseSheet({
    required String id,
    required String title,
    required int totalAmount,
    required DateTime dateCreated,
    required int amountRemaining,
  }) async {
    // Put an expense sheet in.
    await _expenseSheetBox.put(id, <String, dynamic>{
      'id': id,
      'name': title,
      'amount': totalAmount,
      'createdAt': dateCreated,
      'remainingAmount': amountRemaining,
    });
  }

  Future<Map<String, Map<String, dynamic>>> getExpenseSheets() async {
    // Returns a Map<String, Map> with all keys and entries
    final expenseSheetsMap = await _expenseSheetBox.getAllValues();
    return expenseSheetsMap;
  }

  Future<void> deleteExpenseSheet(String id) async {
    await _expenseSheetBox.delete(id);
  }
}
