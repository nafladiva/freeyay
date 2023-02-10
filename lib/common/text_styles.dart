import 'package:flutter/material.dart';

class TStyles {
  static TextStyle heading1({Color? color}) {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  static TextStyle subheading1({Color? color}) {
    return TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  static TextStyle subheading2({Color? color}) {
    return TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  static TextStyle subheading3({Color? color}) {
    return TextStyle(
      fontSize: 11.0,
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  static TextStyle paragraph1({Color? color}) {
    return TextStyle(
      fontSize: 12.0,
      color: color ?? Colors.black,
    );
  }

  static TextStyle paragraph2({Color? color}) {
    return TextStyle(
      fontSize: 10.0,
      color: color ?? Colors.black,
    );
  }

  static TextStyle paragraph3({Color? color}) {
    return TextStyle(
      fontSize: 8.0,
      color: color ?? Colors.black,
    );
  }
}
