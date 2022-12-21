import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectService extends StatelessWidget {
  const SelectService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text(
        "Hizmet Seç",
        style: GoogleFonts.roboto(
          fontSize: 23,
          color: AppThemeData.lightThemeData.primaryColor,
        ),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _serviceButton(context, 'Hizmet Al', Routes.servePage),
          SizedBox(height: 70),
          _serviceButton(context, 'Hizmet Ver', Routes.servicePage),
        ],
      ),
    );
  }

  ElevatedButton _serviceButton(
      BuildContext context, String text, String path) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.grey[200],
        ),
        elevation: MaterialStateProperty.all(1),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 70,
            vertical: 30,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      onPressed: () {
        Application.router.navigateTo(context, path, transition: TransitionType.fadeIn);
      },
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 15,
          color: AppThemeData.lightThemeData.primaryColor,
        ),
      ),
    );
  }
}
