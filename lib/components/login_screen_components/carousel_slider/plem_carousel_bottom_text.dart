import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlemCarouselBottomText extends StatelessWidget {
  const PlemCarouselBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  text: 'earn upto ',
                  style: GoogleFonts.lexend(color: Colors.white, fontSize: 20),
                ),
                TextSpan(
                  text: '500% PLEMs',
                  style: GoogleFonts.lexend(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    foreground:
                        Paint()
                          ..shader = const LinearGradient(
                            colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
                          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                  ),
                ),
                TextSpan(
                  text: ' on your spends',
                  style: GoogleFonts.lexend(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'and get bonus PLEMs on every visit\n',
                  style: GoogleFonts.lexend(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'ab har roz rewards kamao',
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
        ],
      ),
    );
  }
}
