import 'package:gohouse/stores/theme/theme_store.dart';
import 'package:gohouse/ui/pages/explore_page.dart';
import 'package:gohouse/ui/home/home_page.dart';
import 'package:gohouse/ui/pages/my_services.dart';
import 'package:gohouse/ui/pages/service.dart';
import 'package:gohouse/ui/pages/view_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  int i = 0;
  List pages = [
    HomePage(),
    ExplorePage(),
    SelectService(),
    MyServices(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[i],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar(){
    return Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            gap: 10,
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Color.fromARGB(90, 214, 206, 206),
            onTabChange: (value) {
              setState(() {
                i = value;
              });
            },
            padding: EdgeInsets.all(8.0),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: "Ana Sayfa",
              ),
              GButton(
                icon: Icons.location_on_outlined,
                text: "Keşfet",
              ),
              GButton(
                icon: Icons.add,
                text: "Hizmet Ver/Al",
              ),
              GButton(
                icon: Icons.shopping_basket_outlined,
                text: "Hizmetlerim",
              ),
            ],
          ),
        ),
      );
  }
}
