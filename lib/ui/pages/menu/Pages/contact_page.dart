import 'package:flutter/material.dart';
import 'package:gohouse/constants/colors.dart';
import 'package:gohouse/ui/pages/menu/sidebarX_menu.dart';
import 'package:gohouse/ui/pages/menu/widgets/data_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:gohouse/constants/app_theme.dart';

class ContactPage extends StatefulWidget {
  ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _controller = SidebarXController(selectedIndex: 3, extended: true);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
        "Görüş, Öneri ve Şikayetleriniz için",
        style: GoogleFonts.roboto(
            fontSize: 20, color: AppThemeData.lightThemeData.primaryColor),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: true,
      centerTitle: true,
    );
  }

  Widget _body(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bilgiler",
              style: GoogleFonts.tienne(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: AppThemeData.lightThemeData.primaryColor,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 70),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height) * 0.04,
              child: Form(
                child: Column(
                  children: [
                    DataBoxWidget(
                        title: "Ad",
                        icon: Icons.person_outlined,
                        controller: _nameController),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    DataBoxWidget(
                        title: "Soyad",
                        icon: Icons.person_outlined,
                        controller: _surnameController),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    DataBoxWidget(
                        title: "Email",
                        icon: Icons.email_outlined,
                        controller: _emailController),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    TextFormField(
                      controller: _messageController,
                      cursorColor: MenuColors.midnightGreenEagleGreen,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      minLines: 1,
                      maxLength: 300,
                      decoration: InputDecoration(
                          label: Text("Mesajınız"),
                          prefixIcon: Icon(
                            Icons.message_outlined,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 40.0, horizontal: 10.0)),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppThemeData.lightThemeData.primaryColor,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 12,
                          shadowColor: AppThemeData.lightThemeData.primaryColor
                              .withOpacity(0.3),
                        ),
                        child: Text(
                          "Gönder",
                          style: GoogleFonts.tienne(
                            fontSize: 14,
                            color: MenuColors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
