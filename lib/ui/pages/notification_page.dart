import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gohouse/constants/app_theme.dart';

class NotifPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
      key: _scaffoldKey,
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text(
        "Bildirimler",
        style: GoogleFonts.roboto(
            fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: true,
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width) / 20,
        child: Text(
          "Henüz  bildirimin gözükmüyor.\n\n Kampanyalarımızdan ilk sen haberdar olmak istiyorsan bildirimlerini kontrol etmeyi unutma!",
          style: GoogleFonts.tienne(
            fontSize: 18, color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
