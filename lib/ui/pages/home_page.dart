import 'package:boilerplate/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homePageBody(),
    );
  }

  Widget _homePageBody() {
    List<Image> imageList = [
      Image.asset(Assets.bannerImage,),
      Image.asset(Assets.bannerImage,),
      Image.asset(Assets.bannerImage,)
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 90,),
          CarouselSlider(
            items: imageList,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true
            ),
          ),
        ],
      ),
    );
  }
}
