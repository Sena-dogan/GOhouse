import 'package:flutter/material.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/colors.dart';
import 'package:gohouse/ui/pages/menu/widgets/data_box.dart';
import 'package:google_fonts/google_fonts.dart';

class ServePage extends StatefulWidget {
  const ServePage({super.key});

  @override
  State<ServePage> createState() => _ServePageState();
}

class _ServePageState extends State<ServePage> {

  TextEditingController _categoryController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  void dispose() {
    _categoryController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text(
        "Hizmet Ver",
        style: GoogleFonts.roboto(
            fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: true,
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: IconButton(
                iconSize: 100,
                onPressed: () {},
                icon: Icon(Icons.file_upload_outlined),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text("Upload Image"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height) * 0.04,
                child: Form(
                  child: Column(
                    children: [
                      DataBoxWidget(
                          title: "Kategori",
                          icon: Icons.category_outlined,
                          controller: _categoryController),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      DataBoxWidget(
                          title: "Hizmet İsmi",
                          icon: Icons.image_outlined,
                          controller: _nameController),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      DataBoxWidget(
                          title: "Ücret",
                          icon: Icons.price_check_outlined,
                          controller: _priceController),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      DataBoxWidget(
                          title: "Açıklama",
                          icon: Icons.description_outlined,
                          controller: _descriptionController,
                          maxLine: 4,
                          minLine: 2,),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
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
