import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static const primaryColor = Color(0xFF00425A);

  static final myTheme = ThemeData(
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
      color: primaryColor,
    ),
  );
}
