import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  late List<_DropData> _dropDataList;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    final random = Random();
    _dropDataList = List.generate(120, (index) {
      return _DropData(
        startX: random.nextDouble(),
        delay: random.nextDouble(),
        rotation: random.nextDouble() * 2 * pi,
        scale: 0.6 + random.nextDouble() * 1.6,
        speedFactor: 0.5 + random.nextDouble() * 1.8,
        assetUrl: assetUrls[random.nextInt(assetUrls.length)],
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFallingDrop(_DropData drop) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final screenHeight = MediaQuery.of(context).size.height;
        final screenWidth = MediaQuery.of(context).size.width;

        final double progress =
            (_controller.value * drop.speedFactor + drop.delay) % 1.0;
        final double fallY = screenHeight * progress;
        final double maxFall = screenHeight * 0.55 + 100; // lower barrier by 50

        final double y = fallY > maxFall ? maxFall : fallY;
        final double x = screenWidth * drop.startX;

        return Positioned(
          top: y - 40,
          left: x,
          child: Transform.rotate(
            angle: drop.rotation,
            child: Transform.scale(
              scale: drop.scale,
              child: Opacity(
                opacity: 1 - progress,
                child: Image.network(
                  drop.assetUrl,
                  width: 40,
                  height: 40,
                  errorBuilder:
                      (_, __, ___) =>
                          const Icon(Icons.money, color: Colors.white),
                ),
              ),
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
        ..._dropDataList.map(_buildFallingDrop).toList(),

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
                        text: "it’s raining ",
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
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'get joining bonus of 1,000 PLEMs worth ₹100!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexend(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "ab kaisa intezaar, let's PLEM'it yaar",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexend(
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

class _DropData {
  final double startX;
  final double delay;
  final double rotation;
  final double scale;
  final double speedFactor;
  final String assetUrl;

  _DropData({
    required this.startX,
    required this.delay,
    required this.rotation,
    required this.scale,
    required this.speedFactor,
    required this.assetUrl,
  });
}
