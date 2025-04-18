import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SimpleCarousel extends StatefulWidget {
  final List<Widget> bannerImages;
  SimpleCarousel({required this.bannerImages});

  @override
  _SimpleCarouselState createState() => _SimpleCarouselState();
}

class _SimpleCarouselState extends State<SimpleCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.bannerImages.map((widget) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: double.infinity,
                child: widget,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 12),
        // Dots Row (simple and enlarged)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerImages.length, (index) {
            return Container(
              width: _currentIndex == index ? 16.0 : 12.0,
              height: _currentIndex == index ? 16.0 : 12.0,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.black : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
