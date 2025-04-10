import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  const BackgroundWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1744265932/backgroung_hdu9h4.png',
          fit: BoxFit.cover,
        ),
        Scaffold(backgroundColor: Colors.transparent, body: child),
      ],
    );
  }
}
