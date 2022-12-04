import 'dart:async';

import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/constants/strings.dart';
import 'package:gohouse/data/sharedpref/constants/preferences.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:gohouse/widgets/app_icon_widget.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        AppIconWidget(image: Assets.appLogo),
        SizedBox(height: 31.0,),
        Text(Strings.appBanner, style: GoogleFonts.roboto(
          color: Colors.yellow[500],
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),),
      ]),
      color: AppThemeData.lightColorScheme.primary,
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    //TODO: Düzelt
    Application.router
        .navigateTo(context, Routes.home, transition: TransitionType.fadeIn);
  }
}
