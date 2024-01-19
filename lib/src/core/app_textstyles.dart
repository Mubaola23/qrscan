import 'package:flutter/material.dart';
import 'package:qrscan/src/core/extensions.dart';

import 'colors.dart';

class AppTextStyles {
  static TextStyle heading1(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontSize: context.dx(36),
      );

  static TextStyle heading2(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontSize: context.dx(20),
      );

  static TextStyle heading3(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontSize: context.dx(18),
      );

  static TextStyle subtitle(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontSize: context.dx(16),
      );

  static TextStyle smallSubtitle(BuildContext context, {color}) => TextStyle(
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
        fontSize: context.dx(14),
      );

  static TextStyle smallText(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontSize: context.dx(12),
      );
  static TextStyle extraSmall(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontSize: context.dx(10),
      );
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static TextStyle text(BuildContext context) => TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.white,
        fontSize: context.dx(24),
      );
  static TextStyle smalltext(BuildContext context) => TextStyle(
        color: AppColors.grey,
        fontSize: context.dx(18),
      );
  static TextStyle extrasmalltext(BuildContext context) => TextStyle(
        color: AppColors.grey,
        fontSize: context.dx(12),
      );
}
