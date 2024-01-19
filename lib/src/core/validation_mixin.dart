import 'package:flutter/material.dart';

extension ValidationExtension on BuildContext {
  String? validateFieldNotEmpty(String? value) =>
      value == null || value.isEmpty ? 'Field cannot be empty' : null;

  String? validateFieldNotNull<T>(T? value) =>
      value == null ? 'Field cannot be empty' : null;

  String? validateFullName<T>(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';

    if (value.split(' ').length < 2) return 'Please enter your FULL NAME';
    // return null;
  }

  String? validatePhoneNumber<T>(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';
    bool phoneValid = RegExp(r"").hasMatch(value);

    return !phoneValid ? 'Enter a Valid Phone Number' : null;
  }

  String? validateEmailAddress(String? value) {
    if (value == null || value.isEmpty) return 'Field cannot be empty';

    // if (value.isEmpty) return 'Field cannot be empty';

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  String? validatePassword(String? value) => value == null || value.length < 6
      ? 'Password must have 6 or more characters'
      : null;
  String? validateConfirmPassword(String? value, String? pWord) =>
      value == null || value.length < 6
          ? 'Password must have 6 or more characters'
          : value != pWord
              ? "Passwords do not match"
              : null;
}
