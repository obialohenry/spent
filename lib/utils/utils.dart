import 'package:intl/intl.dart';

class Utils {
  ///Format a given [amount] as a price string.
  ///
  ///Adds thousands seperators to the integer [amount], and returns it
  ///in a string format with a naira symbol [₦] prefix .
  /// Example:
  /// ```
  /// Utils.formatPrice(12500); // ₦ 12,500
  /// ```
  static String formatPrice(int amount) {
    final formatAmount = NumberFormat("#,###", "en_NG").format(amount);
    return "₦ $formatAmount";
  }

  ///Format the given [date] as a month and day string (e.g., "October 7").
  static String formatDate(DateTime date) {
    return DateFormat("MMMM d").format(date);
  }
  
  ///Validate that a text field is not empty.
  ///
  ///Retruns a warning message if [value] is null, or contains only white space,
  ///otherwise, returns null to indicate the field is valid.
  static String? validateEmptyTextField(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty.';
    } 
      return null;
    
  }
}
