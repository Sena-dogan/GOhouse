import 'package:boilerplate/constants/app_theme.dart';
import 'package:boilerplate/constants/assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';


import '../../constants/app_theme.dart';
// import 'package:boilerplate/ui/pages/menu/hidden_drawer_menu.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      key: _scaffoldKey,
      drawer: _sideBar(),
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
              _scaffoldKey.currentState?.openDrawer();
              debugPrint("asd");
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

  Widget _sideBar() {
    return SidebarX(
      // controller: SidebarXController(
      //   selectedIndex: 0,
      // ),
      // items: [SidebarXItem(icon: Icons.home, label: "Ana Sayfa")],

      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(color: Colors.black),
        selectedTextStyle: const TextStyle(color: Colors.black),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: LinearGradient(
            colors: [white, actionColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        margin: EdgeInsets.only(right: 10),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SafeArea(
          child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(Assets.pikachuuu, ),
            ),
          ),
        );
      },
      items: [
        const SidebarXItem(
          icon: Icons.home,
          label: 'Ana Sayfa',
        ),
        SidebarXItem(
          icon: Icons.person,
          label: 'Profil',
          onTap: () {
            debugPrint('Hello');

          }, 
        ),
        const SidebarXItem(
          icon: Icons.message,
          label: 'Mesajlar',
        ),
        const SidebarXItem(
          icon: Icons.phone_callback_rounded,
          label: 'Bize Ulaşın',
        ),
        const SidebarXItem(
          icon: Icons.logout,
          label: 'Çıkış',
        ),
      ],
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

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
Color actionColor = AppThemeData.lightColorScheme.primary;

final divider = Divider(color: white.withOpacity(0.3), height: 1);
