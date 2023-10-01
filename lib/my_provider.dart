import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String language = 'en';

  void changeLanguage(String lang) async {
    saveLang(lang);

    language = lang;
    notifyListeners();
  }

  saveLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', lang);
  }

  getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString('lang') ?? 'en';
    notifyListeners();
  }
}
