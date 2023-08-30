import 'package:flutter/material.dart';
import 'package:github_repositories/consts/colors.dart';

abstract class MainStyles {

  static TextStyle kBlackColorW500(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: MainColors.kBlackColor,
    );
  }

  static TextStyle kGreyColorW500(double fontSize) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: MainColors.kGreyColor,
    );
  }
}