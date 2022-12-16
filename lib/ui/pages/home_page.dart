import 'package:fluro/fluro.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/stores/jobs/jobs_store.dart';
import 'package:gohouse/ui/pages/menu/sidebarX_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      key: _scaffoldKey,
      drawer: sideBar(_controller, context),
      body: _homePageBody(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
          debugPrint("asd");
        },
      ),
      title: Container(
        child: Image.asset(Assets.appLogo, fit: BoxFit.contain),
        width: 140,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            Application.router.navigateTo(
              context,
              Routes.notifProfilePage,
              transition: TransitionType.fadeIn,
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            Application.router.navigateTo(
              context,
              Routes.servePage,
              transition: TransitionType.inFromRight,
            );
          },
        ),
      ],
      elevation: 5.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
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
                    shadows: [Shadow(color: Colors.black, blurRadius: 1.0)]),
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
