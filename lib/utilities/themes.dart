import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static String primary = "#7463e3";
  static String secondary = "#8e8e93";
  static String background = "#f7f7f7";
  static String darkPrimary = "#486581";
  static String darkSecondary = "#03dac6";
  static String darkBackground = "#212121";
  static String error = "#d9534f";
  static String success = "#5cb85c";
  static String info = "#5bc0de";
  static String warning = "#f0ad4e";

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color getPrimaryColor() {
    return hexToColor(primary);
  }

  static Color getSecondaryColor() {
    return hexToColor(secondary);
  }

  static Color getBackgroundColor() {
    return hexToColor(background);
  }

  static Color getDarkPrimaryColor() {
    return hexToColor(darkPrimary);
  }

  static Color getDarkSecondaryColor() {
    return hexToColor(darkSecondary);
  }

  static Color getDarkBackgroundColor() {
    return hexToColor(darkBackground);
  }

  static Color getErrorColor() {
    return hexToColor(error);
  }

  static Color getSuccessColor() {
    return hexToColor(success);
  }

  static Color getInfoColor() {
    return hexToColor(info);
  }

  static Color getWarningColor() {
    return hexToColor(warning);
  }


}

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: CupertinoColors.systemBackground,
    bottomAppBarColor: CupertinoColors.tertiarySystemBackground,
    primaryColor: AppColors.getPrimaryColor(),
    secondaryHeaderColor: AppColors.getSecondaryColor(),
    highlightColor: Colors.blueAccent,
    cardColor: Colors.white,
    canvasColor: Colors.white,
    dividerColor: Colors.black,
    errorColor: Colors.red,
    primaryColorDark: AppColors.getDarkPrimaryColor(),
    cursorColor: Colors.redAccent,
    accentColor: Colors.redAccent,
    dialogBackgroundColor: AppColors.getBackgroundColor(),
    splashColor: AppColors.getPrimaryColor(),
    hintColor: AppColors.getInfoColor(),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.getPrimaryColor(),
      textTheme: ButtonTextTheme.primary,
      disabledColor: AppColors.getPrimaryColor(),
      focusColor: Colors.blueAccent,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(color: Colors.black),
      bodyMedium: GoogleFonts.poppins(color: Colors.black),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: AppColors.getDarkBackgroundColor(),
    bottomAppBarColor: Colors.black,
    primaryColor: AppColors.getDarkPrimaryColor(),
    secondaryHeaderColor: AppColors.getDarkSecondaryColor(),
    highlightColor: Colors.blueGrey,
    cardColor: CupertinoColors.darkBackgroundGray,
    canvasColor: Colors.white,
    dividerColor: Colors.white,
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.getDarkPrimaryColor(),
      textTheme: ButtonTextTheme.primary,
      disabledColor: CupertinoColors.darkBackgroundGray,
      focusColor: AppColors.getDarkSecondaryColor(),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(color: Colors.white),
      bodyMedium: GoogleFonts.poppins(color: Colors.white),
    ),
  );
}

class ThemeService {
  final _box = GetStorage();
  final _key = 'isThemeMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}