// import 'package:another_flushbar/flushbar_helper.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gohouse/constants/app_theme.dart';
// import 'package:gohouse/constants/assets.dart';
// import 'package:gohouse/models/user.dart';
// import 'package:gohouse/services/database.dart';
// import 'package:gohouse/utils/routemanager/application.dart';
// import 'package:gohouse/utils/routes/routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:fluro/fluro.dart';
// import 'package:phonenumbers/phonenumbers.dart';

// class RegisterPage extends StatefulWidget {
//   final VoidCallback showLoginPage;
//   const RegisterPage({super.key, required this.showLoginPage});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _nameController = TextEditingController();
//   final _surnameController = TextEditingController();
//   final _phoneController = PhoneNumberEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _surnameController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }

//   // General Methods:-----------------------------------------------------------
//   _showErrorMessage(String message) {
//     if (message.isNotEmpty) {
//       Future.delayed(Duration(milliseconds: 0), () {
//         if (message.isNotEmpty) {
//           FlushbarHelper.createError(
//             message: message,
//             title: "Hata",
//             duration: Duration(seconds: 3),
//           )..show(context);
//         }
//       });
//     }

//     return SizedBox.shrink();
//   }

//   //TODO: Move them to auth service
//   Future signUp() async {
//     final email = UserData.email;
//     final password = UserData.password;
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email ?? '',
//         password: password ?? '',
//       );
//       final user = FirebaseAuth.instance.currentUser;
//       final uid = user!.uid;
//       // Create a new document for the user with the uid
//       await DatabaseService(uid: uid).updateUserData(
//           _nameController.text,
//           email!,
//           _surnameController.text,
//           '');
//       Application.router.navigateTo(context, Routes.mainPage,
//           transition: TransitionType.fadeIn);
//     } on FirebaseAuthException catch (e) {
//       debugPrint('Error: $e');
//       _showErrorMessage(e.message!);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: _buildBody(context),
//     );
//   }

//   SafeArea _buildBody(BuildContext context) {
//     return SafeArea(
//       child: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               //_buildBanner(),
//               const SizedBox(height: 30),
//               Text(
//                 'Let\'s get started',
//                 style: GoogleFonts.bebasNeue(fontSize: 70),
//               ),
//               Text(
//                 'Fill blanks to get all features',
//                 style: TextStyle(
//                   color: Colors.grey[600],
//                   fontSize: 13,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               _buildField(_nameController, 'Name'),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               _buildField(_surnameController, 'Surname'),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               _buildPhoneField(_phoneController, 'Phone'),
//               const SizedBox(
//                 height: 17,
//               ),
//               // Sign in button

//               const SizedBox(height: 10),

//               // Register
//               _buildLoginRef(context)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Row _buildLoginRef(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           'You have an account? ',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         GestureDetector(
//           onTap: (() {
//             Application.router.navigateTo(context, Routes.login,
//                 transition: TransitionType.fadeIn);
//           }),
//           child: const Text(
//             'Login now.',
//             style: TextStyle(
//               color: Colors.blue,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Padding _buildButton(void Function()? onTap, String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: AppThemeData.lightColorScheme.primary,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 17,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildField(
//     TextEditingController _controller,
//     String hint,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 25.0,
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           border: Border.all(
//             color: Colors.white,
//           ),
//           borderRadius: BorderRadius.circular(12), // Fillet edge
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20.0), // Hint padding
//           child: TextFormField(
//             controller: _controller,
//             obscureText: true,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               hintText: hint,
//               //fillColor: Colors.grey[200],
//               //filled: true
//             ), // Enter submit
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPhoneField(
//     PhoneNumberEditingController _controller,
//     String hint,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 25.0,
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           border: Border.all(
//             color: Colors.white,
//           ),
//           borderRadius: BorderRadius.circular(12), // Fillet edge
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20.0), // Hint padding
//           child: PhoneNumberField(
//             controller: _controller,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               hintText: hint,
//               //fillColor: Colors.grey[200],
//               //filled: true
//             ), // Enter submit
//           ),
//         ),
//       ),
//     );
//   }

//   Padding _buildBanner() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 1),
//       child: Hero(
//         tag: 'dash',
//         child: Image.asset(
//           //'https://i.pinimg.com/originals/e1/72/51/e172517ad9cfb16a8f92ca1911ff66ba.jpg',
//           Assets.appLogo,
//           width: 250,
//         ),
//       ),
//     );
//   }
// }
