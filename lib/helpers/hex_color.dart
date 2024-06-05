import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor, {int alpha = 255}) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16) + (alpha << 24);
  }

  HexColor(final String hexColor, {int alpha = 255}) : super(_getColorFromHex(hexColor, alpha: alpha));
}