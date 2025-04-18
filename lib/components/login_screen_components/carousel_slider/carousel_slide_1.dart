import 'dart:math';
import 'package:flutter/material.dart';
import 'plem_carousel_bottom_text.dart';

const double iconSize = 100;

class CarouselSlide1 extends StatefulWidget {
  const CarouselSlide1({super.key});

  @override
  State<CarouselSlide1> createState() => _CarouselSlide1State();
}

class _CarouselSlide1State extends State<CarouselSlide1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late final List<String> innerIcons = [
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955945/plem/iphone_1_aojghm.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955942/plem/airplane_1_t7okwl.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955942/plem/cold_coffee_cup_1_dciefx.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955945/plem/iphone_1_aojghm.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955944/plem/furniture_1_dx4ard.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955945/plem/hotel_1_pmbjw9.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955946/plem/slice_of_pizza_with_mushrooms_1_f84kj0.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955945/plem/grocery_package_1_oscmw8.png',
  ];

  late final List<String> outerIcons = [
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955946/plem/sneakers_1_qba3ew.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955946/plem/medicine_bottle_and_pills_1_xcarzf.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955946/plem/slice_of_pizza_with_mushrooms_1_f84kj0.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955945/plem/shopping_bags_1_nvlojf.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955944/plem/furniture_1_dx4ard.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955945/plem/hoodie_1_tv48gc.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955946/plem/slice_of_pizza_with_mushrooms_1_f84kj0.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955944/plem/furniture_1_dx4ard.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955945/plem/iphone_1_aojghm.png',
    'https://res.cloudinary.com/dmkkl6bcz/image/upload/v1743955946/plem/medicine_bottle_and_pills_1_xcarzf.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildRotatingRing({
    required List<String> icons,
    required double radius,
    required double angleOffset,
    required double speedMultiplier,
  }) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final double rotation = _controller.value * 2 * pi * speedMultiplier;

        return Stack(
          alignment: Alignment.center,
          children: List.generate(icons.length, (i) {
            final double angle =
                rotation + (2 * pi * i / icons.length) + angleOffset;

            final double x = radius * cos(angle);
            final double y = radius * sin(angle);

            return Transform.translate(
              offset: Offset(x, y),
              child: Image.network(
                icons[i],
                height: 100,
                width: 100,
                errorBuilder:
                    (_, __, ___) => const Icon(Icons.broken_image, size: 60),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildRotatingRingPath(double radius, double speedMultiplier) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final double rotation = _controller.value * 2 * pi * speedMultiplier;

        return Transform.rotate(
          angle: rotation,
          child: Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade800, width: 1),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double innerRadius = MediaQuery.of(context).size.width * 0.30;
    final double outerRadius = MediaQuery.of(context).size.width * 0.55;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: OverflowBox(
                    maxWidth: double.infinity,
                    maxHeight: double.infinity,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _buildRotatingRingPath(outerRadius, 1.5),
                        _buildRotatingRingPath(innerRadius, 0.5),
                        _buildRotatingRing(
                          icons: outerIcons,
                          radius: outerRadius,
                          angleOffset: 0,
                          speedMultiplier: 1.5,
                        ),
                        _buildRotatingRing(
                          icons: innerIcons,
                          radius: innerRadius,
                          angleOffset: pi / 8,
                          speedMultiplier: 0.5,
                        ),

                        Image.asset(
                          'assets/flash5.png',
                          height: 120,
                          width: 220,
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const PlemCarouselBottomText(),
            ],
          );
        },
      ),
    );
  }
}
