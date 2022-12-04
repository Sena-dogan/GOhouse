import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

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
        "Keşfet",
        style: GoogleFonts.roboto(
            fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: false,
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.locationBanner),
        SizedBox(
          height: 70,
        ),
        //TODO: size control
        Text(
          "Konumunu Etkinleştir",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 29,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Semtindeki en iyi temizlik personellerini görmek için konumunu etkinleştirmelisin.",
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size(200, 50),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              )),
          onPressed: () {},
          child: Text(
            "Konumunu Etkinleştir",
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
