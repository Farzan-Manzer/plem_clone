import 'package:flutter/material.dart';

class CarouselSlide2 extends StatelessWidget {
  const CarouselSlide2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 🖼 Background image
        Image.asset(
          'assets/frame2.png', // 🔁 Replace with your real image path
          fit: BoxFit.cover,
        ),

        // 📝 Text at the bottom
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
                      const TextSpan(
                        text: 'redeem ',
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
                      const TextSpan(
                        text: ' for ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextSpan(
                        text: 'faadu',
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
                      const TextSpan(
                        text: ' deals',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'on 250+ brands – big brands, bigger savings',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
