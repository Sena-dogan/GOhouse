import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gohouse/stores/user/user_store.dart';
import 'package:gohouse/ui/pages/menu/sidebarX_menu.dart';
import 'package:gohouse/ui/pages/menu/widgets/profile_menu_box.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/constants/app_theme.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // get user from firebase
  final user = FirebaseAuth.instance.currentUser;
  late UserStore _userStore;
  @override
  void didChangeDependencies() {
    _userStore = Provider.of<UserStore>(context);
    if (FirebaseAuth.instance.currentUser != null)
      _userStore
          .getUserData(FirebaseAuth.instance.currentUser!.email.toString());
    super.didChangeDependencies();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = SidebarXController(selectedIndex: 1, extended: true);

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
      centerTitle: true,
    );
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                child:
                    Image.network(_userStore.userdata!.user!.image.toString(),
                        errorBuilder: (context, error, stackTrace) {
                  return Image.asset(Assets.userImageAsset);
                }, fit: BoxFit.cover),
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
              _userStore.userdata!.user!.name.toString(),
              style: GoogleFonts.chewy(fontSize: size.width * 0.1, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _userStore.userdata!.user!.email.toString(),
              style: GoogleFonts.aBeeZee(fontSize: size.width * 0.05, color: Colors.black),
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
              },
            ),
            ProfileMenuWidget(
              title: "Şifreyi Değiştir",
              icon: Icons.password_outlined,
              onPress: () {
                Application.router.navigateTo(
                  context,
                  Routes.changePassword,
                  transition: TransitionType.fadeIn,
                );
              },
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            ProfileMenuWidget(
              title: "Çıkış Yap",
              icon: Icons.logout_outlined,
              onPress: () {
                FirebaseAuth.instance.signOut();
                Application.router.navigateTo(context, Routes.mainPage,
                    transition: TransitionType.fadeIn);
                debugPrint('Signed out');
              },
            ),
          ],
        ),
      ),
    );
  }
}
