import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

var loginHandler = Handler(handlerFunc: ((context, parameters) {
  return LoginScreen();
}));

var homeHandler = Handler(handlerFunc: ((context, parameters) {
  return HomeScreen();
}));


