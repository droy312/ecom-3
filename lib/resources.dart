import 'package:flutter/material.dart';

class Resources {
  Color offWhite = Color.fromRGBO(240, 240, 240, 1);
  Color black = Color.fromRGBO(40, 40, 40, 1);

  String f1 = 'Poppins';
  String f2 = 'Roboto';
  String f3 = 'Varela_Round';

  TextStyle style(Color color, double size, {String font = 'Poppins', bool isBold = false}) {
    return TextStyle(
      color: color,
      fontFamily: font,
      fontSize: size,
      fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
    );
  }
}