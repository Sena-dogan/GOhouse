import 'dart:math';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/data/sharedpref/constants/preferences.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:gohouse/stores/theme/theme_store.dart';
import 'package:gohouse/utils/device/device_utils.dart';
import 'package:gohouse/widgets/progress_indicator_widget.dart';
import 'package:gohouse/widgets/textfield_widget.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  Future signIn() async {
    // get credentials
    String email = _userEmailController.text.trim();
    String password = _passwordController.text.trim();
    // sign in with email and password
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint("Signed in");
    } on FirebaseAuthException catch (e) {
      debugPrint('Error: $e');
      _showErrorMessage(e.message!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      appBar: _loginAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _loginAppBar() {
    return AppBar(
      title: Text(
        "Kayit Ol",
        style: GoogleFonts.roboto(
            fontSize: 25.0,
            color: AppThemeData.lightColorScheme.primary,
            fontWeight: FontWeight.normal),
      ),
      elevation: 5.0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildLeftSide(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : Center(child: _buildRightSide()),
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.appLogo,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildWelcome(),
            SizedBox(height: 70.0),
            _buildUserIdField(),
            SizedBox(height: 20.0),
            _buildPasswordField(),
            SizedBox(height: 12.0),
            _buildForgotPasswordButton(),
            SizedBox(height: 12.0),
            _buildSignInButton(),
            SizedBox(
              height: 13.0,
            ),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Center _buildWelcome() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Image.asset(Assets.appLogo),
      ),
    );
  }


  Widget _buildUserIdField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12), // Fillet edge
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0), // Hint padding
          child: TextField(
            controller: _userEmailController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Email',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 1.0,
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
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  //fillColor: Colors.grey[200],
                  //filled: true
                ),
                onFieldSubmitted: ((value) => signIn()), // Enter submit
              ),
            )));
  }

  Widget _buildForgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              // Application.router.navigateTo(context, Routes.forgot,
              //     transition: TransitionType.fadeIn);
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: () {
          debugPrint('Sign in button pressed');
          signIn();
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppThemeData.lightColorScheme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Sign in',
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

  Widget _buildSignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have account? ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint('Sign up button pressed');
            Application.router.navigateTo(context, Routes.registerPage,transition: TransitionType.fadeIn);
          },
          child: Text(
            'Register now.',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
    // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}


  // Text(
  //       'Hosgeldiniz',
  //       style: TextStyle(
  //         color: Colors.black87,
  //         fontFamily: 'Billabong',
  //         fontSize: 70,
  //         fontWeight: FontWeight.w100,
  //         shadows: <Shadow>[
  //           Shadow(
  //             offset: Offset(0, 2.2),
  //             blurRadius: 199.0,
  //             color: Colors.white,
  //           ),
  //         ],
  //       ),
  //     ),