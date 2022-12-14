import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gohouse/constants/colors.dart';
import 'package:gohouse/ui/pages/menu/sidebarX_menu.dart';
import 'package:gohouse/ui/pages/menu/widgets/profile_menu_box.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
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
        "Profil",
        style: GoogleFonts.tienne(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: AppThemeData.lightThemeData.primaryColor),
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
            Container(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.asset(Assets.pikachuuu),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Bumblebee",
              style: GoogleFonts.chewy(fontSize: 30, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "bumblebee@camaro.com",
              style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            // SizedBox(
            //   width: 200,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: MenuColors.mustard,
            //       side: BorderSide.none,
            //       shape: StadiumBorder(),
            //       elevation: 16,
            //       shadowColor: MenuColors.princetonOrange,
            //     ),
            //     child: Text(
            //       "Profili Düzenle",
            //       style: GoogleFonts.tienne(fontSize: 12),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            ////MENU
            ProfileMenuWidget(
                title: "Profili Düzenle",
                icon: Icons.person_outlined,
                onPress: () {
                  Application.router.navigateTo(context, Routes.editProfilePage,
                      transition: TransitionType.fadeIn);
                }),
            ProfileMenuWidget(
              title: "Şifreyi Değiştir",
              icon: Icons.password_outlined,
              onPress: () {},
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            ProfileMenuWidget(
              title: "Çıkış Yap",
              icon: Icons.logout_outlined,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
