import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselSlide2 extends StatefulWidget {
  const CarouselSlide2({super.key});

  @override
  State<CarouselSlide2> createState() => _CarouselSlide2State();
}

class _CarouselSlide2State extends State<CarouselSlide2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final String brandImageUrl =
      'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1744262062/Flow_Design_Rows_idr821.png';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height * 0.55;
    final imageWidth = screenWidth * 2;

    return Stack(
      children: [
        ClipRect(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final offsetX = _controller.value * -screenWidth;

                return OverflowBox(
                  maxWidth: imageWidth * 1.5,
                  maxHeight: imageWidth * 1.5,
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: -pi / 6,
                    child: Transform.translate(
                      offset: Offset(offsetX, 0),
                      child: Transform.scale(
                        scale: 1.4,
                        child: SizedBox(
                          width: imageWidth,
                          child: Image.network(
                            brandImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'redeem ',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'PLEMs',
                        style: GoogleFonts.lexend(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          foreground:
                              Paint()
                                ..shader = const LinearGradient(
                                  colors: [
                                    Color(0xFFFF512F),
                                    Color(0xFFDD2476),
                                  ],
                                ).createShader(
                                  const Rect.fromLTWH(0, 0, 200, 70),
                                ),
                        ),
                      ),
                      TextSpan(
                        text: ' for ',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: 'faadu',
                        style: GoogleFonts.lexend(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          foreground:
                              Paint()
                                ..shader = const LinearGradient(
                                  colors: [
                                    Color(0xFFFF512F),
                                    Color(0xFFDD2476),
                                  ],
                                ).createShader(
                                  const Rect.fromLTWH(0, 0, 200, 70),
                                ),
                        ),
                      ),
                      TextSpan(
                        text: ' deals',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'on 250+ brands - big brands, bigger savings',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexend(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
