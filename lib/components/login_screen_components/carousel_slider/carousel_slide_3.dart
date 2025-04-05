import 'package:flutter/material.dart';

class CarouselSlide3 extends StatelessWidget {
  const CarouselSlide3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 🖼 Background Image
        Image.asset(
          'assets/frame3.png', // Replace with your actual path
          fit: BoxFit.cover,
        ),

        // 📝 Text overlay
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
                // Heading
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'it’s raining ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextSpan(
                        text: 'PLEMs',
                        style: TextStyle(
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
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Subtext
                const Text(
                  'get joining bonus of 1,000 PLEMs worth ₹100!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),

                const SizedBox(height: 4),

                // Punch line
                Text(
                  'ab kaisa intezaar, let’s PLEM’it yaar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    foreground:
                        Paint()
                          ..shader = const LinearGradient(
                            colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
                          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
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
