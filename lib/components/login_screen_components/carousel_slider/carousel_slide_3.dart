import 'dart:math';
import 'package:flutter/material.dart';

class CarouselSlide3 extends StatefulWidget {
  const CarouselSlide3({super.key});

  @override
  State<CarouselSlide3> createState() => _CarouselSlide3State();
}

class _CarouselSlide3State extends State<CarouselSlide3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<String> assetUrls = [
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1744003082/fall1_wv5vav.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1744003077/rupee_2_vaj97c.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1744003191/3dicons_rhjikn.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1744003270/3dicons_osfssr.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFallingAsset(int index) {
    final random = Random(index);
    final double startX =
        random.nextDouble() * MediaQuery.of(context).size.width;
    final double delay = random.nextDouble();
    final String asset = assetUrls[index % assetUrls.length];

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final double progress = (_controller.value + delay) % 1.0;
        final double fallY = MediaQuery.of(context).size.height * progress;
        final double bounceY = MediaQuery.of(context).size.height * 0.55;
        final double y = fallY > bounceY ? bounceY : fallY;

        return Positioned(
          top: y - 50,
          left: startX,
          child: Opacity(
            opacity: 1 - progress,
            child: Image.network(
              asset,
              width: 40,
              height: 40,
              errorBuilder:
                  (_, __, ___) => const Icon(Icons.money, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ...List.generate(25, (i) => _buildFallingAsset(i)),

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

                const Text(
                  'get joining bonus of 1,000 PLEMs worth ₹100!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),

                const SizedBox(height: 4),

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
