import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/src/screens.dart';

class BalanceSheetDetailScreen extends StatelessWidget {
  const BalanceSheetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpentColors.kIvoryWhite,
      appBar: SpentAppBar.mainAppBar(context, title: "Salary - Aug 205"),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Sub header.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColoredTexts(
                      leadingText: '${SpentStrings.tipCreated}: ',
                      trailingText: 'Aug 3',
                    ),
                    TextView(text: '₦ 45,000', fontSize: 12, color: SpentColors.kPrimary),
                  ],
                ),
                Gap(5),
                ColoredTexts(
                  leadingText: '${SpentStrings.tipRemaining}: ',
                  trailingText: '₦150,000',
                ),
              ],
            ),
            Gap(24),
            Divider(color: SpentColors.kFrostedSteel),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Expense(
                    // key: ValueKey(''),
                    date: 'Aug 3',
                    amount: '25,000',
                    name: 'Rent',
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddExpenseScreen()));
        },
        child: ShimmerSlide(
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(color: SpentColors.kPrimary, shape: BoxShape.circle),
            child: Center(
              child: Icon(Icons.arrow_forward, color: SpentColors.kIvoryWhite, size: 25),
            ),
          ),
        ),
      ),
    );
  }
}

class Expense extends StatelessWidget {
  ///Creates a widget displaying the name, amount, and date of an expense item
  ///added to a balance sheet.
  const Expense({super.key, required this.name, required this.amount, required this.date});

  final String date;
  final String amount;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(text: date, fontSize: 12, fontWeight: FontWeight.bold),
              TextView(text: '₦ $amount', fontSize: 12, fontWeight: FontWeight.bold),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(text: name, fontSize: 12, fontWeight: FontWeight.w400),
              TextView(text: amount, fontSize: 12, fontWeight: FontWeight.w400),
            ],
          ),
        ],
      ),
    );
  }
}
