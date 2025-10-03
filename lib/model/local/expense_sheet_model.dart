class ExpenseSheet {
  String? id;
  String? title;
  String? amountRemaining;
  String? dateCreated;
  String? totalAmount;

  ExpenseSheet({this.id, this.title, this.amountRemaining, this.dateCreated, this.totalAmount});

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
    String? amountRemaining,
    String? dateCreated,
    String? totalAmount,
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
