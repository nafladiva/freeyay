import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static const primaryColor = Color(0xFF443C68);
  static const orangeColor = Colors.orange;

  static final myTheme = ThemeData(
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
      color: primaryColor,
    ),
  );
}
