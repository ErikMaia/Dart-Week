import 'package:flutter/cupertino.dart';

class TextApp {
  static TextApp? _instance;

  TextApp._();

  static TextApp get instance {
    _instance ??= TextApp._();
    return _instance!;
  }

  String get font => "mplus1";

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, fontFamily: font);

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: font);

  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: font);

  TextStyle get textSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: font);

  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: font);

  TextStyle get textExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: font);

  TextStyle get textButtonLable => textBold.copyWith(fontSize: 14);
  
  TextStyle get textTitle => textExtraBold.copyWith(fontSize: 28);
}

extension TextStyleExtencions on BuildContext {
  TextApp get textStyle => TextApp.instance;
}
