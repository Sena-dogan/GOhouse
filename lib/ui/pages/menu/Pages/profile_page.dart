import 'package:flutter/material.dart';
import 'package:gohouse/ui/pages/menu/hidden_drawer_menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/constants/app_theme.dart';

class ProfilePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = SidebarXController(selectedIndex: 1, extended: true);
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
      drawer: sideBar(_controller, context),
      key: _scaffoldKey,
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text(
        "Profile",
        style: GoogleFonts.roboto(
            fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: true,
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width) / 7,
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(Assets.pikachuuu),
              ),
            )
          ],
        ),
      ),
    );
  }
}
