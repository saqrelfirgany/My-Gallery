import 'package:flutter/material.dart';

const titleColor = Color(0xFF4A4A4A);
const formFieldColor = Color(0xFFF7F7F7);
const hintColor = Color(0xFF988F8C);
const buttonColor = Color(0xFF7BB3FF);
const gellaryButtonColor = Color(0xFFEFD8F9);
const logoutGradientFirstColor = Color(0xFFC83B3B);
const logoutGradientSecondColor = Color(0xFFFB4949);
const uploadGradientFirstColor = Color(0xFFFF9900);
const uploadGradientSecondColor = Color(0xFFFFEB38);

class Themes {
  static final light = ThemeData(
    scaffoldBackgroundColor: Color(0xFFE5E5E5),
    // backgroundColor: Colors.white,
    // primaryColor: primaryColor,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    // backgroundColor: darkGreyColor,
    // primaryColor: darkGreyColor,
    brightness: Brightness.dark,
  );
}
