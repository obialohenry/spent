import 'package:flutter/material.dart';
import 'package:spent/src/screens.dart';

class OnboardingViewModel {
  void init(context) {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()));
    });
  }
}
