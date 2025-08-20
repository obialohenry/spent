import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/src/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  MaterialPageRoute(builder: (_) => CreateNewBalanceSheetScreen()),
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
            return BalanceSheetSummaryCard(
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

class BalanceSheetSummaryCard extends StatefulWidget {
  ///Creates a widget displaying a name, date created,
  ///total amount, and amount remaining of a particular balance sheet.

  final String title;
  final String amountRemaining;
  final String dateCreated;
  final String totalAmount;

  const BalanceSheetSummaryCard({
    super.key,
    required this.title,
    required this.amountRemaining,
    required this.dateCreated,
    required this.totalAmount,
  });

  @override
  State<BalanceSheetSummaryCard> createState() => _BalanceSheetSummaryCardState();
}

class _BalanceSheetSummaryCardState extends State<BalanceSheetSummaryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _translationAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 7));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: Curves.bounceInOut),
      ),
    );
    _translationAnimation = Tween<Offset>(begin: Offset(-0.5, -0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: Curves.bounceInOut),
      ),
    );
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1, curve: Curves.bounceInOut),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: _translationAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Dismissible(
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
                  //TODO:Remove item from list.

                  //TODO:Implement my Alert message toast.
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
                          TextView(text: widget.title, fontSize: 20, fontWeight: FontWeight.bold),
                          TextView(
                            text: widget.amountRemaining,
                            fontSize: 16,
                            color: SpentColors.kPrimary,
                          ),
                        ],
                      ),
                      Gap(8),
                      ColoredTexts(
                        leadingText: '${SpentStrings.tipCreated}: ',
                        trailingText: widget.dateCreated,
                      ),
                      ColoredTexts(
                        leadingText: '${SpentStrings.tipTotal}: ',
                        trailingText: widget.totalAmount,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
