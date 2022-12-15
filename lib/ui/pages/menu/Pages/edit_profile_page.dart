import 'package:flutter/material.dart';
import 'package:gohouse/constants/colors.dart';
import 'package:gohouse/ui/pages/menu/widgets/user_data_box.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/constants/app_theme.dart';

class EditProfileWidget extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  EditProfileWidget({super.key});

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
        "Profili Düzenle",
        style: GoogleFonts.roboto(
            fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
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
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.asset(Assets.pikachuuu),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: AppThemeData.lightThemeData.primaryColor.withOpacity(0.7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            // Container(
            //   width: 120,
            //   height: 120,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(120),
            //     child: Image.asset(Assets.pikachuuu),
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.transparent,
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(100),
            //     ),
            //     border: Border.all(
            //         color: Colors.black, width: 2.0, style: BorderStyle.solid),
            //   ),
            // ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Form(
              child: Column(
                children: [
                  UserDataBoxWidget(
                    title: "Ad Soyad",
                    icon: Icons.person_outline,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 70),
                  UserDataBoxWidget(
                    title: "Email",
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 70),
                  UserDataBoxWidget(
                    title: "Telefon",
                    icon: Icons.phone_outlined,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 70),
                  UserDataBoxWidget(
                    title: "Şifre",
                    icon: Icons.password_outlined,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppThemeData.lightThemeData.primaryColor,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 12,
                        shadowColor: AppThemeData.lightThemeData.primaryColor
                            .withOpacity(0.3),
                      ),
                      child: Text(
                        "Kaydet",
                        style: GoogleFonts.tienne(
                          fontSize: 14,
                          color: MenuColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
