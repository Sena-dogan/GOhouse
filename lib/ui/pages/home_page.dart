import 'package:boilerplate/constants/app_theme.dart';
import 'package:boilerplate/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppBar(),
      body: _homePageBody(),
    );
  }

  PreferredSizeWidget _homeAppBar() {
    return AppBar(
      title: Text("Home"),
      automaticallyImplyLeading: false,
      backgroundColor: AppThemeData.lightColorScheme.primary,
      elevation: 4.0,
    );
  }

  Widget _homePageBody() {
    List<Image> imageList = [
      Image.asset(
        Assets.bannerImage,
        fit: BoxFit.fill,
        width: 2000.0,
      ),
    ];

    List<Widget> bannerSliders = imageList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(0.1),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0.1)),
                    child: Stack(
                      children: <Widget>[
                        item,
                      ],
                    )),
              ),
            ))
        .toList();

    List<Widget> drawerList = [
      Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            Assets.serviceDrawer1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' Hizmet Al',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
              Text(
                ' Ilanlari',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            Assets.serviceDrawer2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' Hali yikama',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
              Text(
                ' Ilanlari',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            Assets.serviceDrawer3,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' Koltuk Yikama',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
              Text(
                'Ilanlari',
                style: GoogleFonts.roboto(color: Colors.white, shadows: [
                  Shadow(
                    blurRadius: 100.0,
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    ];

    List<Widget> imageSliders = drawerList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        item,
                      ],
                    )),
              ),
            ))
        .toList();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 30.0,
            color: AppThemeData.lightColorScheme.primary,
          ),
          Container(
            color: AppThemeData.lightColorScheme.primary,
            child: CarouselSlider(
              items: bannerSliders,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                pauseAutoPlayOnTouch: true,
              ),
            ),
          ),
          Container(
            color: AppThemeData.lightColorScheme.primary,
            height: 50,
          ),
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: false,
              height: 311,
              viewportFraction: 0.45,
            ),
          ),
        ],
      ),
    );
  }
}
