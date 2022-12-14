import 'package:gohouse/ui/home/home.dart';
import 'package:gohouse/ui/login/forgotPass.dart';
import 'package:gohouse/ui/login/login.dart';
import 'package:gohouse/ui/login/register.dart';
import 'package:gohouse/ui/my_app.dart';
import 'package:gohouse/ui/pages/menu/Pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:gohouse/ui/pages/menu/Pages/contact_page.dart';
import 'package:gohouse/ui/pages/menu/Pages/edit_profile_page.dart';
import 'package:gohouse/ui/pages/menu/Pages/profile_page.dart';

var loginHandler = Handler(handlerFunc: ((context, parameters) {
  return LoginScreen();
}));

var homeHandler = Handler(handlerFunc: ((context, parameters) {
  return HomeScreen();
}));

var profileHandler = Handler(handlerFunc: ((context, parameters) {
  return ProfilePage();
}));

var chatHandler = Handler(handlerFunc: ((context, parameters) {
  return ChatPage();
}));

var contactHandler = Handler(handlerFunc: ((context, parameters) {
  return ContactPage();
}));

var registerHandler = Handler(handlerFunc: ((context, parameters) {
  return RegisterPage(
    showLoginPage: () {},
  );
}));

var mainHandler = Handler(handlerFunc: ((context, parameters) {
  return MainPage();
}));

var editProfileHandler = Handler(handlerFunc: ((context, parameters) {
  return EditProfileWidget();
}));

var forgotPasswordHandler = Handler(handlerFunc: ((context, parameters) {
  return ForgotPassPage();
}));