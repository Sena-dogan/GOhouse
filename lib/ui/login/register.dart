import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/constants/assets.dart';
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

  Future signUp() async {
    if (_passController.text != _confirmPassControl.text ||
        _passController.text.isEmpty == true ||
        _emailController.text.isEmpty == true ||
        _passController.text.length < 6) {
      setState(() {
        passMatch = false;
      });
      debugPrint('nope wrong pass');
      return;
    }
    passMatch = true;
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //_buildBanner(),
                const SizedBox(height: 30),
                Text(
                  'Register!',
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
                _buildEmailField(),
                const SizedBox(
                  height: 10.0,
                ),
                _buildPassField(),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: _buildConfirmPass(),
                ),
                const SizedBox(
                  height: 17,
                ),
                Visibility(
                  visible: !passMatch,
                  child: Text(
                    _passController.text.length < 6
                        ? 'Password must be at least 6 characters'
                        : 'Incorrect email or password.',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              );
  }

  Container _buildConfirmPass() {
    return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(12), // Fillet edge
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0), // Hint padding
                    child: TextFormField(
                      controller: _confirmPassControl,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm password',
                        //fillColor: Colors.grey[200],
                        //filled: true
                      ),
                      onFieldSubmitted: (value) => signUp(), // Enter submit
                    ),
                  ),
                );
  }

  Padding _buildPassField() {
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
                    padding:
                        const EdgeInsets.only(left: 20.0), // Hint padding
                    child: TextFormField(
                      controller: _passController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        //fillColor: Colors.grey[200],
                        //filled: true
                      ),
                      onFieldSubmitted: (value) {}, // Enter submit
                    ),
                  ),
                ),
              );
  }

  Padding _buildEmailField() {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12), // Fillet edge
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0), // Hint padding
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
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
