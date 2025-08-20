import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spent/src/model.dart';
import 'package:spent/src/screens.dart';
// import 'package:spent/src/utils.dart';

// final splashViewModel = FutureProvider<SplashState>((ref) async {
//   await Future.delayed(Duration(seconds: 3));
//   if (DummyData.firstTimeOnApp) {
//     return SplashState.onboarding;
//   } else {
//     return SplashState.home;
//   }
// });

final onboardingViewModel = ChangeNotifierProvider((ref) => OnboardingViewModel(ref));

class OnboardingViewModel with ChangeNotifier {
  Ref ref;
  OnboardingViewModel(this.ref);
  Future<void> checkUser(context) async {
    await Future.delayed(Duration(seconds: 3));

    if (!context.mounted) return;

    if (DummyData.firstTimeOnApp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
