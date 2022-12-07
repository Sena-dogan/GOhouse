import 'package:flutter/material.dart';
import 'package:password_policy/password_policy.dart';

class Auth {
  static bool isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  PasswordPolicy passwordPolicy = PasswordPolicy(
    minimumScore: 0.8,
    validationRules: [
      LengthRule(minimalLength: 6),
      UpperCaseRule(minimumUpperCaseCharacters: 1),
      DigitRule(minimumNbDigits: 1, isMandatory: false),
      NoSpaceRule(),
    ],
  );
  bool isPasswordValid(String password) {
    PasswordCheck passwordCheck =
        PasswordCheck(password: password, passwordPolicy: passwordPolicy);
    return passwordCheck.isValid;
  }
}
