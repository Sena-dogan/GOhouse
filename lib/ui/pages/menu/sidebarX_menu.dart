import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/ui/my_app.dart';
import 'package:gohouse/ui/home/home_page.dart';
// import 'package:gohouse/ui/pages/menu/Pages/chat_page.dart';
import 'package:gohouse/utils/routemanager/application.dart';
// import 'package:gohouse/utils/routes/routehandlers.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

Widget sideBar(SidebarXController controll, BuildContext context, ) {
  // const primaryColor = Color(0xFF685BFF);
  // const canvasColor = Color(0xFF2E2E48);
  // const scaffoldBackgroundColor = Color(0xFF464667);
  // const accentCanvasColor = Color(0xFF3E3E61);
  const white = Colors.white;
  Color actionColor = AppThemeData.lightColorScheme.primary;

  final divider = Divider(color: white.withOpacity(0.3), height: 1);
  return SidebarX(
    controller: controll,
    theme: SidebarXTheme(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(150),
      ),
      textStyle: const TextStyle(color: Colors.black),
      selectedTextStyle: const TextStyle(color: Colors.black),
      itemTextPadding: const EdgeInsets.only(left: 30),
      selectedItemTextPadding: const EdgeInsets.only(left: 30),
      itemDecoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      selectedItemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                Assets.userImageLink,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(Assets.userImageAsset);
                },
              ),
            ),
          ),
        ),
      );
    },
    items: [
      SidebarXItem(
        icon: Icons.home,
        label: 'Ana Sayfa',
        onTap: () {
          Application.router.navigateTo(context, Routes.home,
              transition: TransitionType.fadeIn);
        },
      ),
      SidebarXItem(
        icon: Icons.person,
        label: 'Profil',
        onTap: () {
          Application.router.navigateTo(context, Routes.profilePage,
              transition: TransitionType.fadeIn);
        },
      ),
      SidebarXItem(
        icon: Icons.message,
        label: 'Mesajlar',
        onTap: () {
          Application.router.navigateTo(context, Routes.chatPage,
              transition: TransitionType.fadeIn);
        },
      ),
      SidebarXItem(
        icon: Icons.phone_callback_rounded,
        label: 'Bize Ulaşın',
        onTap: () {
          Application.router.navigateTo(context, Routes.contactPage,
              transition: TransitionType.fadeIn);
        },
      ),
      SidebarXItem(
        icon: Icons.logout,
        label: 'Çıkış',
        onTap: () {
          FirebaseAuth.instance.signOut();
          Application.router.navigateTo(context, Routes.mainPage,
              transition: TransitionType.fadeIn);
          debugPrint('Signed out');
        },
      ),
    ],
  );
}
