import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/colors.dart';
import 'package:gohouse/models/jobs.dart';
import 'package:gohouse/stores/jobs/jobs_store.dart';
import 'package:gohouse/stores/user/user_store.dart';
import 'package:gohouse/ui/pages/menu/widgets/data_box.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String? imgUrl;
  late UserStore _userStore;
  late JobsStore _jobsStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _jobsStore = Provider.of<JobsStore>(context);
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void uploadImage() async {
    debugPrint('Edit Profile Image Button Pressed');
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    var imgFile = File(image!.path);
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      // contentType: 'image/png',
      customMetadata: {'picked-file-path': imgFile.path},
    );
    UploadTask uploadTask;
    Reference ref =
        _firebaseStorage.ref().child('JobImages/${image.name}');
    try {
      uploadTask = ref.putData(await imgFile.readAsBytes(), metadata);
      imgUrl = await (await uploadTask).ref.getDownloadURL();
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
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
      centerTitle: true,
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            imgUrl == null ? _uploadImageIcon() : _imagePreview(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.011),
            imgUrl == null ? Text("Upload Image") : Text(""),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            _fieldPreview(context)
          ],
        ),
      ),
    );
  }

  Image _imagePreview() {
    return Image.network(
      imgUrl!,
      height: 130,
      width: 250,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return _uploadImageIcon();
      },
    );
  }

  Container _uploadImageIcon() {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: IconButton(
        iconSize: 100,
        onPressed: uploadImage,
        icon: Icon(Icons.file_upload_outlined),
      ),
    );
  }

  Padding _fieldPreview(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height) * 0.04,
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
              controller: _priceController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            DataBoxWidget(
              title: "Açıklama",
              icon: Icons.description_outlined,
              controller: _descriptionController,
              maxLine: 4,
              minLine: 2,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (imgUrl == null ||
                      _categoryController.text.isEmpty ||
                      _nameController.text.isEmpty ||
                      _priceController.text.isEmpty ||
                      _descriptionController.text.isEmpty)
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Hata"),
                              content: Text("Lütfen tüm alanları doldurunuz"),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("Tamam"))
                              ],
                            ));
                  else {
                    _jobsStore.addData(JobCreateRequest(
                      category: _categoryController.text,
                      name: _nameController.text,
                      price: _priceController.text,
                      description: _descriptionController.text,
                      image: imgUrl,
                      user: _userStore.userdata!.user!.email.toString()
                    ));
                    showDialog(
                        context: context,
                        builder: ((context) {
                          return AlertDialog(
                            title: Text("Başarılı"),
                            content: Text("Hizmetiniz başarıyla eklendi"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Application.router
                                        .navigateTo(context, Routes.servicePage);
                                  },
                                  child: Text("Tamam"))
                            ],
                          );
                        }));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppThemeData.lightThemeData.primaryColor,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 12,
                  shadowColor:
                      AppThemeData.lightThemeData.primaryColor.withOpacity(0.3),
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
    );
  }
}
