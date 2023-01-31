import 'package:flutter/material.dart';

import '../Style/app_styles.dart';
import '../Style/colors_app.dart';
import '../Style/text_styles.dart';

class ThemeConfig {
  static ThemeConfig? _instance;
  ThemeConfig._();
  static ThemeConfig get instance {
    _instance ??= ThemeConfig._();
    return _instance!;
  }

  static final _defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: Colors.grey[400]!));
  final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black)),
    primaryColor: ColorsApp.instance.primary,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsApp.instance.primary,
        primary: ColorsApp.instance.primary,
        secondary: ColorsApp.instance.secondary),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.instance.primaryButton),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(13),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        labelStyle: TextApp.instance.textRegular.copyWith(color: Colors.black),
        errorStyle:
            TextApp.instance.textRegular.copyWith(color: Colors.redAccent)),
  );
}
