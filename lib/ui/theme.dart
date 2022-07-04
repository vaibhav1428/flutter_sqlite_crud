import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const Color darkgray = Color(0xFF121212);
const Color darkHeader = Color(0xFF424242);
const primaryClr = bluishClr;

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryClr,
    backgroundColor: bluishClr,
  );

  static final dark = ThemeData(
    backgroundColor: darkHeader,
    brightness: Brightness.dark,
    primaryColor: darkgray,
  );
}

TextStyle get labelStyles {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.grey[400] : darkHeader,
  ));
}

TextStyle get inputtextStyles {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[800],
  ));
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.grey[400] : darkHeader,
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? white : darkHeader,
  ));
}
