import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  var _appTheme = lightTheme;

  ThemeData get appTheme => _appTheme;

  get isDardMode => _appTheme == darkTheme;

  void fetchTheme() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.getString('app_theme') == null) {
      _appTheme = lightTheme;
    }
    _appTheme = prefs.getString('app_theme').toString().compareTo('dark') == 0
        ? darkTheme
        : lightTheme;
    notifyListeners();
  }

  void changeTheme() async {
    var prefs = await SharedPreferences.getInstance();
    if (isDardMode) {
      _appTheme = lightTheme;
      await prefs.setString('app_theme', 'light');
    } else {
      _appTheme = darkTheme;
      await prefs.setString('app_theme', 'dark');
    }
    notifyListeners();
  }
}

ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    cardColor: Colors.white,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black)),
    textTheme: TextTheme(
        titleSmall: TextStyle(color: Colors.white, fontSize: 12),
        titleMedium: TextStyle(color: Colors.white, fontSize: 16),
        titleLarge: TextStyle(color: Colors.white, fontSize: 20)));

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    cardColor: Colors.black,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.black,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
        titleSmall: TextStyle(color: Colors.black, fontSize: 12),
        titleMedium: TextStyle(color: Colors.black, fontSize: 16),
        titleLarge: TextStyle(color: Colors.black, fontSize: 20)));
