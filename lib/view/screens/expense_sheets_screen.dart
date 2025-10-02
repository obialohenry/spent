import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/src/screens.dart';

class ExpenseSheetsScreen extends StatefulWidget {
  const ExpenseSheetsScreen({super.key});

  @override
  State<ExpenseSheetsScreen> createState() => _ExpenseSheetsScreenState();
}

class _ExpenseSheetsScreenState extends State<ExpenseSheetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpentColors.kIvoryWhite,
      appBar: AppBar(
        backgroundColor: SpentColors.kTransparent,
        leadingWidth: 120,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextView(text: SpentStrings.spent, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CreateNewExpenseSheetScreen()),
                );
              },
              child: ShimmerSlide(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(color: SpentColors.kPrimary, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.arrow_upward_outlined,
                      color: SpentColors.kIvoryWhite,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 32, horizontal: 16),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return ExpenseSheet(
              // key: ValueKey(''),
              title: 'FreLancee Payment',
              amountRemaining: '₦ 45,000',
              dateCreated: 'Aug 30',
              totalAmount: '₦ 80,000',
            );
          },
        ),
      ),
    );
  }
}

class ExpenseSheet extends StatelessWidget {
  ///Creates a widget displaying a name, date created,
  ///total amount, and amount remaining of a particular balance sheet.

  final String title;
  final String amountRemaining;
  final String dateCreated;
  final String totalAmount;

  const ExpenseSheet({
    super.key,
    required this.title,
    required this.amountRemaining,
    required this.dateCreated,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(''),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: SpentColors.kBlushPetal,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, size: 30, color: SpentColors.kBrightRed),
      ),
      onDismissed: (direction) {
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AnExpenseSheetDetailsScreen()));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: SpentColors.kIvoryWhite,
            border: Border.all(color: SpentColors.kPearlAsh),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(text: title, fontSize: 20, fontWeight: FontWeight.bold),
                  TextView(
                    text: amountRemaining,
                    fontSize: 16,
                    color: SpentColors.kPrimary,
                  ),
                ],
              ),
              Gap(8),
              ColoredTexts(
                leadingText: '${SpentStrings.tipCreated}: ',
                trailingText: dateCreated,
              ),
              ColoredTexts(
                leadingText: '${SpentStrings.tipTotal}: ',
                trailingText: totalAmount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
