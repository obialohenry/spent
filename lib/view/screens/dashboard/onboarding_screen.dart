import 'package:flutter/material.dart';
import 'package:spent/cofig/spent_images.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/view/components/button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpentColors.kMintWhisper,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: Column(
            children: [
              Spacer(),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    TextView(
                      text: SpentStrings.trackYourSpendingEffortlessly,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      fontSize: 22,
                      maxLines: 3,
                    ),
                    Gap(16),
                    TweenAnimationBuilder(
                      tween: Tween(begin: 0.8, end: 1.0),
                      duration: Duration(milliseconds: 350),
                      curve: Curves.easeOutBack,
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: ImageView.asset(SpentImages.noteDollarIcon, scale: 2.0),
                        );
                      },
                    ),
                    Gap(16),
                    TextView(text: SpentStrings.balanceSheetDescription, fontSize: 16, maxLines: 3),
                    Gap(24),
                    SpentButtonMain(
                      text: SpentStrings.getStarted,
                      borderRadius: 8,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}