import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/stores/jobs/jobs_store.dart';
import 'package:gohouse/stores/user/user_store.dart';
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
  late UserStore _userStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
    if (FirebaseAuth.instance.currentUser != null)
      _userStore
          .getUserData(FirebaseAuth.instance.currentUser!.email.toString());
    // if (_userStore.userdata!.user!.image != null)
    //   Assets.userImage = _userStore.userdata!.user!.image.toString();
    // debugPrint(Assets.userImage);
    //Assets.userImageLink = _userStore.userdata!.user!.image!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: _appBar(),
              key: _scaffoldKey,
              drawer: sideBar(_controller, context),
              body: _homePageBody(),
            );
          } else {
            return Scaffold(
              appBar: _appBar(),
              key: _scaffoldKey,
              drawer: sideBar(_controller, context),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
        future: _userStore
            .getUserData(FirebaseAuth.instance.currentUser!.email.toString()));
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
          debugPrint("Open Drawer");
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
          onPressed: () {},
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
              child: _bannerContainer(item),
            ))
        .toList();

    List<Widget> drawerList = [
      _hizmetAl(),
      _haliYikama(),
      _koltukYikama(),
    ];

    List<Widget> imageSliders =
        drawerList.map((item) => _circularConverter(item)).toList();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 30.0,
            color: AppThemeData.lightColorScheme.primary,
          ),
          _mainSlider(bannerSliders: bannerSliders),
          Container(
            color: AppThemeData.lightColorScheme.primary,
            height: 50,
          ),
          _imageSlider(imageSliders: imageSliders),
        ],
      ),
    );
  }

  Container _bannerContainer(Image item) {
    return Container(
      margin: EdgeInsets.all(0.1),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(0.1)),
          child: Stack(
            children: <Widget>[
              item,
            ],
          )),
    );
  }

  Container _circularConverter(Widget item) {
    return Container(
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
    );
  }
}

class _imageSlider extends StatelessWidget {
  const _imageSlider({
    Key? key,
    required this.imageSliders,
  }) : super(key: key);

  final List<Widget> imageSliders;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageSliders,
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: false,
        height: 311,
        viewportFraction: 0.45,
      ),
    );
  }
}

class _mainSlider extends StatelessWidget {
  const _mainSlider({
    Key? key,
    required this.bannerSliders,
  }) : super(key: key);

  final List<Widget> bannerSliders;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _koltukYikama extends StatelessWidget {
  const _koltukYikama({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GestureDetector(
          onTap: () =>
              Application.router.navigateTo(context, Routes.servicePage, transition: TransitionType.fadeIn),
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
    );
  }
}

class _haliYikama extends StatelessWidget {
  const _haliYikama({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GestureDetector(
          onTap: () =>
              Application.router.navigateTo(context, Routes.servicePage, transition: TransitionType.fadeIn),
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
    );
  }
}

class _hizmetAl extends StatelessWidget {
  const _hizmetAl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GestureDetector(
          onTap: () {
            debugPrint("Hizmet al");
            Application.router.navigateTo(context, Routes.servicePage, transition: TransitionType.fadeIn);
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
    );
  }
}
