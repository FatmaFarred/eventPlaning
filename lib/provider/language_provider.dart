
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyAppLanguageProvider extends ChangeNotifier {
  String MyAppLanguage = 'ar';
  MyAppLanguageProvider (){
    getlanguage();
  }
  void changelanguage(String newLanguage) {
    if (MyAppLanguage == newLanguage) {
      return;
    }
    MyAppLanguage = newLanguage;
    savelanguage(MyAppLanguage);
    notifyListeners();
  }

  Future<void> savelanguage(String Mylanguage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("App language", Mylanguage);
  }

  Future<void> getlanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? MyApp = prefs.getString("App language");
    if (MyApp != null) {
      if (MyApp == 'ar') {
        MyAppLanguage = 'ar';
      } else {
        MyAppLanguage = 'en';
      }
    }
    notifyListeners();
  }
}