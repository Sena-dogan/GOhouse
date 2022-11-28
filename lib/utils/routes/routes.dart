import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:boilerplate/utils/routes/routehandlers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String login = '/login';
  static const String home = '/home';

  static void configureRoutes(FluroRouter router) {
    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.notFoundHandler = Handler(handlerFunc: ((context, parameters) {
      debugPrint("Route not found");
      return;
    }));
  }
}
