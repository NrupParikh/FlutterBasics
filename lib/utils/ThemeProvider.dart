// ignore_for_file: unrelated_type_equality_checks

import 'package:first_flutter_application/utils/PreferenceManager.dart';
import 'package:flutter/material.dart';

enum ThemeType { light, dark }

enum LocalType { en, hi, ar }

class ThemeProvider extends ChangeNotifier {
  PreferenceManager pre = PreferenceManager();
  ThemeData currentTheme = ThemeData.light(useMaterial3: true);
  ThemeType themeType = ThemeType.light;

  Locale currentLocal = Locale(LocalType.en.toString());
  LocalType localType = LocalType.en;

  ThemeProvider() {
    setInitialTheme();
    setInitialLocal();
  }

  setInitialTheme() {
    ThemeData theme = ThemeData.light(useMaterial3: true);
    pre.getTheme().then((value) {
      if (value != "null") {
        if ((value == "dark")) {
          theme = ThemeData.dark(useMaterial3: true);
        } else {
          theme = ThemeData.light(useMaterial3: true);
        }
      }

      currentTheme = theme;

      if ((theme == ThemeType.light)) {
        themeType = ThemeType.light;
      } else {
        themeType = ThemeType.dark;
      }
      notifyListeners();
    });
  }

  setInitialLocal() {
    Locale local = Locale(LocalType.en.toString());
    pre.getLocal().then((value) {
      if (value != "null") {
        if (value == "en") {
          local = Locale(LocalType.en.toString());
        } else if (value == "hi") {
          local = Locale(LocalType.hi.toString());
        } else if (value == "ar") {
          local = Locale(LocalType.ar.toString());
        }
      }

      currentLocal = local;

      if (local == LocalType.en) {
        localType = LocalType.en;
      } else if (local == LocalType.hi) {
        localType = LocalType.hi;
      } else if (local == LocalType.ar) {
        localType = LocalType.ar;
      }
      notifyListeners();
    });
  }

  changeCurrentTheme(BuildContext context) {
    if (currentTheme == ThemeData.dark(useMaterial3: true)) {
      themeType = ThemeType.light;
      currentTheme = ThemeData.light(useMaterial3: true);
    } else {
      themeType = ThemeType.dark;
      currentTheme = ThemeData.dark(useMaterial3: true);
    }

    pre.setTheme(themeType.name);
    notifyListeners();
  }

  changeCurrentLocal(BuildContext context, String newLocal) {
    if (newLocal == "en") {
      localType = LocalType.en;
      currentLocal = Locale(LocalType.en.toString());
    } else if (newLocal == "hi") {
      localType = LocalType.hi;
      currentLocal = Locale(LocalType.hi.toString());
    } else if (newLocal == "ar") {
      localType = LocalType.ar;
      currentLocal = Locale(LocalType.ar.toString());
    }
    pre.setLocal(localType.name);
    notifyListeners();
  }
}
