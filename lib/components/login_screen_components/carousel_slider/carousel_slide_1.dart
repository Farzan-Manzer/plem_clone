import 'package:flutter/material.dart';

class CarouselSlide1 extends StatelessWidget {
  const CarouselSlide1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox.expand(
          child: Image.asset('assets/frame1.png', fit: BoxFit.cover),
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
                      const TextSpan(
                        text: 'earn upto ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextSpan(
                        text: '500% PLEMs',
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
                        text: ' on your spends',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'and get bonus PLEMs on every visit\n',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      TextSpan(
                        text: 'ab har roz rewards kamao',
                        style: TextStyle(
                          fontSize: 14,
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
