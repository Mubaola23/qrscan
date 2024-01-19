import 'package:flutter/material.dart';

const emptyInputBorder = OutlineInputBorder(borderSide: BorderSide.none);
const neverScrollPhysics = NeverScrollableScrollPhysics();
const bouncingScrollPhysics = BouncingScrollPhysics();
const boxShadow = [
  BoxShadow(
    color: Color.fromRGBO(201, 201, 201, 0.18),
    offset: Offset(0.0, 8.0),
    blurRadius: 20.0,
  ),
];

// Sizes
const designWidth = 428;
const designHeight = 926;

// constants
class AppStrings {
  AppStrings._();

  static const userInfoKey = "userInfoKey";
}
