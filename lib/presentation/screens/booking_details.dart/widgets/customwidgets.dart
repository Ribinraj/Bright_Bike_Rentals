import 'package:bright_bike_rentals/core/colors.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  ImageCarouselState createState() => ImageCarouselState();
}

class ImageCarouselState extends State<ImageCarousel> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  final List<String> _images = [
    'assets/images/man-riding-motorcycle-road-with-words-word-side.jpg',
    'assets/images/moto-food-delivery-man-rides-motor-bike-with-thermal-backpack-food-deliver-service-generative-ai.jpg',
    'assets/images/man-riding-motorcycle-road-with-words-word-side.jpg'
  ];

  void _nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            child: IconButton(
              style: IconButton.styleFrom(padding: EdgeInsets.zero),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Appcolors.kblackColor,
                size: 30,
              ),
              onPressed: _previousPage,
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              style: IconButton.styleFrom(padding: EdgeInsets.zero),
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Appcolors.kblackColor,
                size: 30,
              ),
              onPressed: _nextPage,
            ),
          ),
        ],
      ),
    );
  }
}
