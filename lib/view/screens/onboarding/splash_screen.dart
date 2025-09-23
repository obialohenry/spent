import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spent/src/components.dart';
import 'package:spent/src/config.dart';
import 'package:spent/view_model/splash_view_model.dart.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _textSizeAnimation;
  // bool _initialized = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _textSizeAnimation = Tween<double>(
      begin: 0.0,
      end: 70.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    ref.read(splashViewModel).checkUser(context);
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   if (!_initialized) {
  //     _initialized = true;
  //     ref.read(splashViewModel).checkUser(context);
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
