import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final List<Color> colors;
  final double borderRadius;
  final double verticalPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.colors = const [Color(0xFFFF512F), Color(0xFFDD2476)],
    this.borderRadius = 12.0,
    this.verticalPadding = 16.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(colors: colors),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.redRose(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
