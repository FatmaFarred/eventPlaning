import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppThemeProvier extends ChangeNotifier {
  ThemeMode MyAppTheme = ThemeMode.light;
  MyAppThemeProvier (){
    gettheme();

  }

  void changeAppTheme(ThemeMode newTheme) {
    if (MyAppTheme == newTheme) {
      return;
    }
    MyAppTheme = newTheme;
    savetheme(MyAppTheme: MyAppTheme);

    notifyListeners();
  }

  Future<void> savetheme({ required ThemeMode MyAppTheme}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("Mytheme", MyAppTheme == ThemeMode.light ? "light" : "dark");

  }

  Future<void> gettheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? Mytheme = prefs.getString("Mytheme");
    if (Mytheme!=null ){
      if (Mytheme=="light"){
        MyAppTheme=ThemeMode.light;
      }else {
        MyAppTheme=ThemeMode.dark;
      }
    }
  notifyListeners();
  }





  }
