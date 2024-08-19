import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        buildImageContainer(
          const AssetImage('assets/img/courusel/1.jpg'),
        ),
        buildImageContainer(
          const AssetImage('assets/img/courusel/2.jpg'),
        ),
        buildImageContainer(
          const AssetImage('assets/img/courusel/3.jpg'),
        ),
      ],
      options: CarouselOptions(
        height: 180,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        reverse: true,
      ),
    );
  }

  Widget buildImageContainer(ImageProvider imageProvider) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
