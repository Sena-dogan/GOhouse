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
        fit: BoxFit.cover,
        width: 3000.0,
        height: 5000.0,
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
          GestureDetector(
            onTap: () {
              debugPrint("Hizmet al");
            },
            child: Image.asset(
              Assets.serviceDrawer1,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' Hizmet Al',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 1.0 )]),
              ),
              Text(
                ' Ilanlari',
                style: GoogleFonts.roboto(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      Stack(
        alignment: Alignment.bottomLeft,
        children: [
          GestureDetector(
            onTap: () => debugPrint("Hali Yikama"),
            child: Image.asset(
              Assets.serviceDrawer2,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' Hali yikama',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              Text(
                ' Ilanlari',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        offset: Offset(1, 1),
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
      Stack(
        alignment: Alignment.bottomLeft,
        children: [
          GestureDetector(
            onTap: () => debugPrint("Koltuk Yikama"),
            child: Image.asset(
              Assets.serviceDrawer3,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' Koltuk Yikama',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 9.0,
                      )
                    ]),
              ),
              Text(
                'Ilanlari',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 9.0,
                        color: Colors.black,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                    fontWeight: FontWeight.bold),
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
