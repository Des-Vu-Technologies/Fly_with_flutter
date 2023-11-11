import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#ED9728");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color grey = HexColor.fromHex("#737477");
  static Color primaryWithOpacity70 = HexColor.fromHex("#B3ffED9728");

  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFf");
  static Color red = HexColor.fromHex("#e61f34"); //color:red FF:100%
}
//changing hex value to color object

extension HexColor on Color {
  static Color fromHex(String hexValue) {
    String hexColorString = hexValue.replaceAll('#', ''); //ED9728
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opasity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
