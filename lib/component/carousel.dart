import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui'; // Untuk efek blur

class CarouselDemo extends StatefulWidget {
  CarouselDemo({super.key, required this.imageList});
  List imageList;

  @override
  _CarouselDemoState createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: 0.6,
          height: 430.0, // Tinggi carousel
          
          autoPlay: true, // Carousel bergerak otomatis
          enlargeCenterPage: true, // Membesarkan item di tengah
          aspectRatio: 9 / 16,
          autoPlayAnimationDuration: Duration(seconds: 1),
           onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },// Durasi per gambar
        ),
        itemCount: widget.imageList.length,
        itemBuilder: (context, index, realIndex) {
            final isCenter = index == _currentIndex;
            return AnimatedOpacity(
              duration: Duration(milliseconds: 300), // Durasi animasi transparansi
              opacity: isCenter ? 1.0 : 0.5, // Item tengah jelas, yang lain pudar
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    widget.imageList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
  }
}