import 'package:flutter/material.dart';
import 'package:gohouse/ui/pages/menu/sidebarX_menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:gohouse/constants/app_theme.dart';

class ContactPage extends StatelessWidget {
  final _controller = SidebarXController(selectedIndex: 3, extended: true);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ContactPage({super.key});

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
        "Contact",
        style: GoogleFonts.roboto(
            fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: true,
    );
  }
  
  Widget _body(BuildContext context){
    return Center(child: Text("Contact Page"),);
  }
}