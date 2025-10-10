class ExpenseSheet {
  String? id;
  String? title;
  int? amountRemaining;
  DateTime? dateCreated;
  int? totalAmount;

  ExpenseSheet({this.id, this.title, this.amountRemaining, this.dateCreated, this.totalAmount});

  ///Takes in a `json` object, and returns it as an `ExpenseSheet`.
  factory ExpenseSheet.fromJson(Map<String, dynamic> json) {
    return ExpenseSheet(
      id: json['id'] as String?,
      title: json['name'] as String?,
      amountRemaining: json['remainingAmount'] as int?,
      dateCreated: json['createdAt'] as DateTime?,
      totalAmount: json['amount'] as int?,
    );
  }

  @override
  String toString() =>
      "ExpenseSheet(id: $id,title: $title,amountRemaining: $amountRemaining,dateCreated: $dateCreated,totalAmount:$totalAmount,)";

  ///Create a new [ExpenseSheet] based on the current one.
  ///
  ///Returns a copy of the expense sheet with any provided parameters passed in.
  ///If no parameter is given, the original values are preserved
  ExpenseSheet copyAndUpdate({
    String? id,
    String? title,
    int? amountRemaining,
    DateTime? dateCreated,
    int? totalAmount,
  }) {
    return ExpenseSheet(
      id: id ?? this.id,
      title: title ?? this.title,
      amountRemaining: amountRemaining ?? this.amountRemaining,
      dateCreated: dateCreated ?? this.dateCreated,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }
}
