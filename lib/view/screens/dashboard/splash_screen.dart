import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/src/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late List<bool> _visibleLetters;
  @override
  void initState() {
    super.initState();
    _visibleLetters = List.filled(SpentStrings.spent.length, false);
    _beginAnimation();
    _navigateToOnboardingScreen();
  }

  /// Starts the animation by:
  /// 1. Defining a total duration of `1s`.
  /// 2. Calculating the delay for each letter: `total duration in ms ÷ text length` (integer division).
  /// 3. Looping through each letter in the text.
  /// 4. For each letter, scheduling a delayed visibility change:
  ///    - Delay = `letter index × delay per letter`.
  /// 5. Updating the state to reveal letters one by one.
  void _beginAnimation() {
    final totalDuration = Duration(seconds: 1);
    final delayPerLetter =
        totalDuration.inMilliseconds ~/ SpentStrings.spent.length; // integer division
    for (int i = 0; i < SpentStrings.spent.length; i++) {
      Future.delayed(Duration(milliseconds: i * delayPerLetter), () {
        if (mounted) {
          setState(() {
            _visibleLetters[i] = true;
          });
        }
      });
    }
  }

  /// Waits for `2s` before navigating to the onboarding screen.
  void _navigateToOnboardingScreen() {
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SpentColors.kPrimary,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(SpentStrings.spent.length, (index) {
            return AnimatedOpacity(
              opacity: _visibleLetters[index] ? 1.0 : 0.0,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeIn,
              child: TextView(
                text: SpentStrings.spent[index],
                fontWeight: FontWeight.bold,
                fontSize: 70,
                color: SpentColors.kIvoryWhite,
              ),
            );
          }),
        ),
      ),
    );
  }
}
