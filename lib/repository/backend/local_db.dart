import 'package:hive/hive.dart';

class SpentLocalDb {
  late final BoxCollection _collection;
  late final CollectionBox<Map<String, dynamic>> _expenseSheetBox;
  SpentLocalDb._();
  static final SpentLocalDb _instance = SpentLocalDb._();
  factory SpentLocalDb() {
    return _instance;
  }

  /// Create a box collection
  Future<void> init() async {
    _collection = await BoxCollection.open(
      'SpentAppBox', // Name of your database
      {'expenseSheets', 'expenses'}, // Names of your boxes
      path: './', // Path where to store your boxes (Only used in Flutter / Dart IO)
      // key: HiveCipher(), // Key to encrypt your boxes (Only used in Flutter / Dart IO)
    );
    // Open your boxes. Optional: Give it a type.
    _expenseSheetBox = await _collection.openBox<Map<String, dynamic>>('expenseSheets');
  }

  Future<void> putAnExpenseSheet({
    required String id,
    required String title,
    required double totalAmount,
    required String dateCreated,
    required double amountRemaining,
  }) async {
    // Put an expense sheet in.
    await _expenseSheetBox.put(id, {
      'name': title,
      'amount': totalAmount,
      'createdAt': dateCreated,
      'remainingAmount': amountRemaining,
    });
  }

  Future<Map<String, Map<String, dynamic>>?> getExpenseSheets() async {
    // Returns a Map<String, Map> with all keys and entries
    final expenseSheetsMap = await _expenseSheetBox.getAllValues();
    return expenseSheetsMap;
  }
}
