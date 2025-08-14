import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/src/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _textSizeAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _textSizeAnimation = Tween<double>(
      begin: 0.0,
      end: 70.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    _navigateToOnboardingScreen();
  }

  /// Waits for `2s` before navigating to the onboarding screen.
  void _navigateToOnboardingScreen() {
    Future.delayed(Duration(seconds: 3), () {
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
        child: AnimatedBuilder(
          animation: _textSizeAnimation,
          builder: (context, widget) {
            return TextView(
              text: SpentStrings.spent,
              fontWeight: FontWeight.bold,
              fontSize: _textSizeAnimation.value,
              color: SpentColors.kIvoryWhite,
            );
          },
        ),
      ),
    );
  }
}
