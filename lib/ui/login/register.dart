import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/services/database.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluro/fluro.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassControl = TextEditingController();

  bool passMatch = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _confirmPassControl.dispose();
    super.dispose();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: "Hata",
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  //TODO: Move them to auth service
  Future signUp() async {
    final email = _emailController.text.trim();
    final password = _passController.text.trim();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = FirebaseAuth.instance.currentUser;
      final uid = user!.uid;
      // Create a new document for the user with the uid
      await DatabaseService(uid: uid)
          .updateUserData(email.split("@")[0], '', email, 0, 'https://t3.ftcdn.net/jpg/01/18/01/98/360_F_118019822_6CKXP6rXmVhDOzbXZlLqEM2ya4HhYzSV.jpg');
      Application.router.navigateTo(context, Routes.mainPage,
          transition: TransitionType.fadeIn);
    } on FirebaseAuthException catch (e) {
      debugPrint('Error: $e');
      _showErrorMessage(e.message!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //_buildBanner(),
              const SizedBox(height: 30),
              Text(
                'Register Now!',
                style: GoogleFonts.bebasNeue(fontSize: 70),
              ),
              Text(
                'and be a part of the GOhouse.',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 30),
              _buildField(_emailController, 'Email', (value){}, false),
              const SizedBox(
                height: 10.0,
              ),
              _buildField(_passController, 'Password', (value){}, true),
              const SizedBox(
                height: 10.0,
              ), 
              _buildField(_confirmPassControl, 'Confirm Password', (value) => signUp(), true),
              const SizedBox(
                height: 17,
              ),
              const SizedBox(
                height: 8,
              ),
              // Sign in button
              _buildSignUp(),

              const SizedBox(height: 10),

              // Register
              _buildLoginRef(context)
            ],
          ),
        ),
      ),
    );
  }

  Row _buildLoginRef(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'You have an account? ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: (() {
            Application.router.navigateTo(context, Routes.login,
                transition: TransitionType.fadeIn);
          }),
          child: const Text(
            'Login now.',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildSignUp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: signUp,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppThemeData.lightColorScheme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'Sign up',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }

    Widget _buildField(
    TextEditingController _controller,
    String hint,
    void Function(String) onFieldSubmitted,
    bool isPassword,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(12), // Fillet edge
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0), // Hint padding
          child: TextFormField(
            controller: _controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              //fillColor: Colors.grey[200],
              //filled: true
            ), // Enter submit
            onFieldSubmitted: onFieldSubmitted,
          ),
        ),
      ),
    );
  }

  Padding _buildBanner() {
    return Padding(
      padding: const EdgeInsets.only(left: 1),
      child: Hero(
        tag: 'dash',
        child: Image.asset(
          //'https://i.pinimg.com/originals/e1/72/51/e172517ad9cfb16a8f92ca1911ff66ba.jpg',
          Assets.appLogo,
          width: 250,
        ),
      ),
    );
  }
}
