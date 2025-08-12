import 'package:flutter/material.dart';
import 'package:spent/src/config.dart';

class ShimmerSlide extends StatefulWidget {
  ///Creates a shiny "Glass reflection" on it's child widget.
  const ShimmerSlide({super.key, required this.child});
  final Widget child;
  @override
  State<ShimmerSlide> createState() => _ShimmerSlideState();
}

class _ShimmerSlideState extends State<ShimmerSlide> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              colors: [
                SpentColors.kTransparent,
                SpentColors.kSnowGlass.withAlpha((0.2 *255).toInt()),
                SpentColors.kTransparent,
              ],
              // stops: const [0.0, 0.5,1.0],
              begin: Alignment(-1.0 + _controller.value * 2, 0),
              end: const Alignment(1.0, 0),
            ).createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
