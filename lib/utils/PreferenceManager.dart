import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {

  // ===================== THEME
  Future<void> setTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme);
  }


  Future<String> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('theme').toString();
  }


  // ===================== LOCAL
  Future<void> setLocal(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("PREF_LANG $languageCode");
    prefs.setString('language', languageCode);
  }


  Future<String> getLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('language').toString();
  }
}