import 'package:shared_preferences/shared_preferences.dart';

class UserSettings {
  //dark mode

  //pomodoros until long break
  //short break len
  //long break len
  //auto resume timer
  //sound
  //notifications
  //commented out values are the default values
  static const String pomoLenKey = "pomolenkey"; //= 25;
  static const String shortBreakLenKey = "shortbreaklenkey"; //= 5;
  static const String longBreakLenKey = "longbreaklenkey"; //= 15;
  static const String autoResumeKey = "autoresumekey"; //= false;
  static const String notificationKey = "notificationkey"; //= true;

  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool get autoResume => prefs.getBool(autoResumeKey) ?? false;
  bool get notification => prefs.getBool(notificationKey) ?? true;
  String get pomoLen => prefs.getString(pomoLenKey) ?? "25";
  String get longBreakLen => prefs.getString(longBreakLenKey) ?? "15";
  String get shortBreakLen => prefs.getString(shortBreakLenKey) ?? "5";

  Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }
}
