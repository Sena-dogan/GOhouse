import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:gohouse/constants/colors.dart';
import 'package:gohouse/models/user.dart';
import 'package:gohouse/stores/user/user_store.dart';
import 'package:gohouse/ui/pages/menu/widgets/data_box.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileWidget extends StatefulWidget {
  EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late UserStore _userStore;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String? imgUrl;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
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
        FirebaseStorage.instance.ref().child('images/${image.name}');
    try {
      uploadTask = ref.putData(await imgFile.readAsBytes(), metadata);
      imgUrl = await (await uploadTask).ref.getDownloadURL();
      setState(() {
        if (imgUrl != null) Assets.userImageLink = imgUrl!;
        _userStore.getUserData(_userStore.userdata!.user!.email.toString());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

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
            GestureDetector(
              onTap: uploadImage,
              child: Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.network(
                        Assets.userImageLink,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(Assets.userImageAsset);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: AppThemeData.lightThemeData.primaryColor
                            .withOpacity(0.7),
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
                  NameDataBox(),
                  SizedBox(height: MediaQuery.of(context).size.height / 70),
                  SurnameDataBox(),
                  SizedBox(height: MediaQuery.of(context).size.height / 70),
                  EmaiDataBox(),
                  SizedBox(height: MediaQuery.of(context).size.height / 70),
                  //TODO Ulke kodu
                  PhoneDataBox(),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint('Edit Profile Button Pressed');
                        _userStore.editData(EditUserRequest(
                          name: _nameController.text.isEmpty
                              ? _userStore.userdata!.user!.name
                              : _nameController.text,
                          surname: _surnameController.text.isEmpty
                              ? _userStore.userdata!.user!.surname
                              : _surnameController.text,
                          email: _emailController.text.isEmpty
                              ? _userStore.userdata!.user!.email
                              : _emailController.text,
                          image: imgUrl == null
                              ? _userStore.userdata!.user!.image
                              : imgUrl.toString(),
                          phone: _phoneController.text.isEmpty
                              ? _userStore.userdata!.user!.phone
                              : int.parse(_phoneController.text),
                          id: _userStore.userdata!.user!.id,
                        ));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Bilgileriniz Güncellendi'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Application.router.navigateTo(
                                          context, Routes.home,
                                          transition: TransitionType.fadeIn);
                                    },
                                    child: Text('Tamam'))
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

  DataBoxWidget PhoneDataBox() {
    return DataBoxWidget(
      controller: _phoneController,
      title: _userStore.userdata!.user!.phone!.isNaN
          ? "Telefon"
          : _userStore.userdata!.user!.phone.toString(),
      icon: Icons.phone_outlined,
    );
  }

  DataBoxWidget EmaiDataBox() {
    return DataBoxWidget(
      controller: _emailController,
      title: _userStore.userdata!.user!.email!.isEmpty
          ? "Email"
          : _userStore.userdata!.user!.email.toString(),
      icon: Icons.email_outlined,
    );
  }

  DataBoxWidget SurnameDataBox() {
    return DataBoxWidget(
      controller: _surnameController,
      title: _userStore.userdata!.user!.surname!.isEmpty
          ? "Soyad"
          : _userStore.userdata!.user!.surname.toString(),
      icon: Icons.person_outline,
    );
  }

  DataBoxWidget NameDataBox() {
    return DataBoxWidget(
      controller: _nameController,
      title: _userStore.userdata!.user!.name ?? "Ad",
      icon: Icons.person_outline,
    );
  }
}
