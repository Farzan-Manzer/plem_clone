import 'package:flutter/material.dart';
import 'dart:math';

class RotatingRing extends StatefulWidget {
  final double radius;
  final double speed;
  final List<String> assets;

  RotatingRing({
    required this.radius,
    required this.speed,
    required this.assets,
  });

  @override
  _RotatingRingState createState() => _RotatingRingState();
}

class _RotatingRingState extends State<RotatingRing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.speed.toInt()),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: List.generate(widget.assets.length, (index) {
            double angle =
                (index * 2 * pi / widget.assets.length) +
                (_controller.value * 2 * pi);
            return Positioned(
              left:
                  widget.radius * cos(angle) +
                  MediaQuery.of(context).size.width / 2 -
                  10,
              top:
                  widget.radius * sin(angle) +
                  MediaQuery.of(context).size.height / 2 -
                  10,
              child: Image.asset(widget.assets[index], width: 30, height: 30),
            );
          }),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
