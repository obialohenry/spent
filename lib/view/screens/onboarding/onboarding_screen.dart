import 'package:flutter/material.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/src/screens.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    //TODO:Set the firstTimeOnApp to false.
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 4));

    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                      text: SpentStrings.hdrTrackYourSpendingEffortlessly,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      fontSize: 22,
                      maxLines: 3,
                    ),
                    Gap(16),
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: ImageView.asset(SpentImages.noteDollarIcon, scale: 2.0),
                    ),
                    Gap(16),
                    TextView(text: SpentStrings.balanceSheetDescription, fontSize: 16, maxLines: 3),
                    Gap(24),
                    ShimmerSlide(
                      child: SpentButtonMain(
                        text: SpentStrings.btnGetStarted,
                        borderRadius: 8,
                        color: SpentColors.kPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                          );
                        },
                      ),
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
