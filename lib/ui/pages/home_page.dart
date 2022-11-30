import 'package:boilerplate/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../../constants/app_theme.dart';
// import 'package:boilerplate/ui/pages/menu/hidden_drawer_menu.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _homePageBody(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
            },
          ),
          SizedBox(
            width: 100.0,
          ),
          Text(
            "GOHouse",
            style: GoogleFonts.roboto(
                fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
          ),
          SizedBox(
            width: 54.0,
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      elevation: 2.0,
      automaticallyImplyLeading: false,
    );
  }

  Widget _homePageBody() {
    List<Image> imageList = [
      Image.asset(
        Assets.bannerImage,
      ),
      Image.asset(
        Assets.bannerImage,
      ),
      Image.asset(
        Assets.bannerImage,
      )
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          CarouselSlider(
            items: imageList,
            options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
          ),
        ],
      ),
    );
  }
}
