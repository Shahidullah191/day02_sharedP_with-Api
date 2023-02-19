import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiperExample extends StatefulWidget {
  const CardSwiperExample({Key? key}) : super(key: key);

  @override
  State<CardSwiperExample> createState() => _CardSwiperExampleState();
}

class _CardSwiperExampleState extends State<CardSwiperExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Swiper"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://www.w3schools.com/w3css/img_lights.jpg",
          );
        },
        itemCount: 10,
        viewportFraction: 0.8,
        scale: 0.9,
      )
    );
  }
}

