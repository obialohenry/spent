import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spent/repository/backend/local_db.dart';
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

final splashViewModel = ChangeNotifierProvider((ref) => SplashViewModel(ref));

class SplashViewModel with ChangeNotifier {
  Ref ref;
  SplashViewModel(this.ref);
  Future<void> checkUser(context) async {
    await ref.read(spentLocalDb).getFirstTimeOnAppStatus();
    await Future.delayed(Duration(seconds: 2));

    if (!context.mounted) return;

    if (DummyData.firstTimeOnApp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ExpenseSheetsScreen()),
      );
    }
  }
}
