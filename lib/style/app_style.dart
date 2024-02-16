import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Colors.white;
  static Color mainColor = Colors.black;
  static Color accentColor = Colors.blue;

  static List<Color> cardsColor = [
    Colors.black,
    Colors.pink,
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.blueGrey,
  ];

  // Setting text style.
  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
  );

  static TextStyle subTitle = GoogleFonts.nunito(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );
}
