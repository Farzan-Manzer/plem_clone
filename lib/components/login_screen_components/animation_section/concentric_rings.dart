import 'package:flutter/material.dart';
import 'dart:math';

class ConcentricRings extends StatefulWidget {
  final double outerRingSize;
  final double innerRingSize;
  final double iconSize;
  final String centerLogo;
  final List<String> outerRingAssets;
  final List<String> innerRingAssets;

  const ConcentricRings({
    required this.outerRingSize,
    required this.innerRingSize,
    required this.iconSize,
    required this.centerLogo,
    required this.outerRingAssets,
    required this.innerRingAssets,
    Key? key,
  }) : super(key: key);

  @override
  _ConcentricRingsState createState() => _ConcentricRingsState();
}

class _ConcentricRingsState extends State<ConcentricRings>
    with TickerProviderStateMixin {
  late AnimationController _outerController;
  late AnimationController _innerController;

  @override
  void initState() {
    super.initState();

    _outerController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();

    _innerController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _outerController.dispose();
    _innerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.outerRingSize,
      width: widget.outerRingSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotationTransition(
            turns: _outerController,
            child: _buildRing(widget.outerRingSize, widget.outerRingAssets),
          ),

          RotationTransition(
            turns: Tween<double>(begin: 0, end: -1).animate(_innerController),
            child: _buildRing(widget.innerRingSize, widget.innerRingAssets),
          ),

          Image.asset(widget.centerLogo, width: widget.iconSize * 2),
        ],
      ),
    );
  }

  Widget _buildRing(double ringSize, List<String> assets) {
    return SizedBox(
      height: ringSize,
      width: ringSize,
      child: Stack(
        children: List.generate(assets.length, (index) {
          double angle = (2 * pi * index) / assets.length;
          double radius = ringSize / 2;

          return Positioned(
            left: radius + radius * cos(angle) - (widget.iconSize / 2),
            top: radius + radius * sin(angle) - (widget.iconSize / 2),
            child: Image.asset(assets[index], width: widget.iconSize),
          );
        }),
      ),
    );
  }
}
