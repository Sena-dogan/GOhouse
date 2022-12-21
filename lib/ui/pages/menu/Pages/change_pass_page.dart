import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/colors.dart';
import 'package:gohouse/ui/pages/menu/widgets/data_box.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({super.key});

  @override
  State<ChangePassPage> createState() => _ChangePassWidgetState();
}

class _ChangePassWidgetState extends State<ChangePassPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _oldPassController = TextEditingController();
  TextEditingController _newPassController = TextEditingController();
  TextEditingController _newPassAgainController = TextEditingController();

  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController.dispose();
    _newPassAgainController.dispose();
    super.dispose();
  }

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
        "Şifreyi Değiştir",
        style: GoogleFonts.roboto(
          fontSize: 23,
          color: AppThemeData.lightThemeData.primaryColor,
        ),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: true,
      centerTitle: true,
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width) / 10,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  child: Column(
                    children: [
                      DataBoxWidget(
                          title: "Eski Şifre",
                          icon: Icons.password_outlined,
                          controller: _oldPassController),
                      SizedBox(height: MediaQuery.of(context).size.height / 40),
                      DataBoxWidget(
                          title: "Yeni Şifre",
                          icon: Icons.password_outlined,
                          controller: _newPassController),
                      SizedBox(height: MediaQuery.of(context).size.height / 40),
                      DataBoxWidget(
                          title: "Yeni Şire Tekrar",
                          icon: Icons.password_outlined,
                          controller: _newPassAgainController),
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_newPassController.text.isEmpty ||
                                _newPassAgainController.text.isEmpty ||
                                _oldPassController.text.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Hata"),
                                    content: Text("Lütfen boş alan bırakmayın"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Tamam"),
                                      )
                                    ],
                                  );
                                },
                              );
                              return;
                            }
                            if (_newPassController.text ==
                                _newPassAgainController.text) {
                              try {
                                FirebaseAuth.instance.currentUser!
                                    .updatePassword(_newPassController.text);
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Hata"),
                                      content: Text(e.toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Tamam"),
                                        )
                                      ],
                                    );
                                  },
                                );
                              }
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Başarılı"),
                                      content: Text(
                                          "Şifreniz başarıyla değiştirildi"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Application.router.navigateTo(
                                                context, Routes.home,
                                                transition:
                                                    TransitionType.fadeIn);
                                          },
                                          child: Text("Tamam"),
                                        )
                                      ],
                                    );
                                  });
                            } else
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Hata"),
                                    content: Text("Şifreler uyuşmuyor"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Tamam"),
                                      )
                                    ],
                                  );
                                },
                              );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppThemeData.lightThemeData.primaryColor,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 12,
                            shadowColor: AppThemeData
                                .lightThemeData.primaryColor
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
        ),
      ),
    );
  }
}
