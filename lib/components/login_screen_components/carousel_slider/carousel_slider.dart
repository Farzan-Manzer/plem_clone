import 'dart:async';
import 'package:flutter/material.dart';
import 'carousel_slide_1.dart';
import 'carousel_slide_2.dart';
import 'carousel_slide_3.dart';

class HorizontalCarouselSlider extends StatefulWidget {
  const HorizontalCarouselSlider({super.key});

  @override
  State<HorizontalCarouselSlider> createState() =>
      _HorizontalCarouselSliderState();
}

class _HorizontalCarouselSliderState extends State<HorizontalCarouselSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoPlayTimer;

  final List<Widget> _slides = const [
    CarouselSlide1(),
    CarouselSlide2(),
    CarouselSlide3(),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      _currentPage = (_currentPage + 1) % _slides.length;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoPlayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: _slides.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return _slides[index];
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_slides.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 12 : 8,
              height: _currentPage == index ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    _currentPage == index ? Colors.white : Colors.grey.shade600,
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
