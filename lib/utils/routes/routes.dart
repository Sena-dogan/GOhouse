import 'package:gohouse/utils/routes/routehandlers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String login = '/login';
  static const String home = '/home';
  static const String profilePage = '/profile';
  static const String chatPage = '/chat';
  static const String contactPage = '/contact';
  static const String registerPage = '/register';
  static const String mainPage = '/main';
  static const String forgotPassword = '/forgotPassword';
  static const String editProfilePage = '/account';

  static void configureRoutes(FluroRouter router) {
    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.define(profilePage, handler: profileHandler);
    router.define(chatPage, handler: chatHandler);
    router.define(contactPage, handler: contactHandler);
    router.define(registerPage, handler: registerHandler);
    router.define(mainPage, handler: mainHandler);
    router.define(forgotPassword, handler: forgotPasswordHandler);
    router.define(editProfilePage, handler: editProfileHandler);
    router.notFoundHandler = Handler(handlerFunc: ((context, parameters) {
      debugPrint("Route not found");
      return;
    }));
  }
}
