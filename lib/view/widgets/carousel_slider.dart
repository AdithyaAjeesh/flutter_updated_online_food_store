// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  final int scrollDelay;
  const CarouselSliderWidget({
    super.key,
    required this.scrollDelay,
  });

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int activeIndex = 0;
  final List<String> carouseImage1 = [
    'assets/fast-food-menu-ads-design-template-2cb6155ec23e1e0b9417e7f75ba5c4ad_screen.jpg',
    'assets/15b08d3d8b411079a8b3a8a2b8a2b23e.jpg',
    'assets/fast-food-design-template-0dac6ce85afc9a58c0d3c7ff865076bc_screen.jpg',
    'assets/85217101a2da2f7cd0c1e97c854a0ce1.jpg',
    'assets/restaurant-menu-ads-design-template-414ec905fe00564199dac8708c47dd5d_screen.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouseImage1.length,
      itemBuilder: (BuildContext, index, realIndex) {
        final String imagePath = carouseImage1[index];
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: AssetImage(imagePath),
          ),
        );
      },
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: widget.scrollDelay),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(
            () {
              activeIndex = index;
            },
          );
        },
      ),
    );
  }
}
