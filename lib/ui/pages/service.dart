import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_theme.dart';

class Service extends StatelessWidget {
  const Service({super.key});

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
        "Hizmet Ekle",
        style: GoogleFonts.roboto(
            fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: false,
    );
  }
  
  Widget _body(BuildContext context){
    return Center(child: Text("Love u"),);
  }
}