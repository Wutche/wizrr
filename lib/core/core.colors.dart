import "package:flutter/material.dart";

Color _rgba(int r,int g, int b, {double a=1}){
  return Color.fromRGBO(r, g, b, a);
}

class AppColor{
  static Color primary = _rgba(22,66,60);
  static Color white = _rgba(255, 255, 255);
  static Color black = Colors.black;
  static Color red = _rgba(255,0,0);
  static Color inactive = _rgba(154,160,166);
  static Color light = _rgba(243,243,243);
  static Color orange = _rgba(240,147,25);
  static Color gray = _rgba(217,217,217);
  static Color gray_2 = _rgba(232,232,232);
  static Map<int, Color> grayShade = {
    100:_rgba(243,243,243),
    200:_rgba(232,232,232),
    300:_rgba(217,217,217),
    400:_rgba(154,160,166),
    600:_rgba(154,160,166)
  };
  static Color dark = _rgba(8,15,14);
  static Map<int, Color> darkShade = {
    50:_rgba(8,15,14,a:0.05),
    100:_rgba(8,15,14,a:0.1),
    200:_rgba(8,15,14,a:0.2),
    300:_rgba(8,15,14,a:0.3),
    400:_rgba(8,15,14,a:0.4),
    500:_rgba(8,15,14,a:0.5),
    600:_rgba(8,15,14,a:0.6),
    700:_rgba(8,15,14,a:0.7),
    800:_rgba(8,15,14,a:0.8),
    900:_rgba(8,15,14,a:0.9),
  };

  static Color rgba(int r,int g, int b,{double a=1}){
    return _rgba(r, g, b,a:a);
  }

}
