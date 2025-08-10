import 'package:flutter/material.dart';
import 'package:spent/src/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: SpentColors.kPrimary, body: Center());
  }
}