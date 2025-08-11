import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';

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
      body: Column(
        children: [
          TextView(
            text: SpentStrings.trackYourSpendingEffortlessly,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ],
      ),
    );
  }
}