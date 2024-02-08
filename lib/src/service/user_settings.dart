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
  static const String _pomoLenKey = "pomolenkey"; //= 25;
  static const String _shortBreakLenKey = "shortbreaklenkey"; //= 5;
  static const String _longBreakLenKey = "longbreaklenkey"; //= 15;
  static const String _autoResumeKey = "autoresumekey"; //= false;
  static const String _notificationKey = "notificationkey"; //= true;

  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool get autoResume => prefs.getBool(_autoResumeKey) ?? false;
  bool get notification => prefs.getBool(_notificationKey) ?? true;
  String get pomoLen => prefs.getString(_pomoLenKey) ?? "25";
  String get longBreakLen => prefs.getString(_longBreakLenKey) ?? "15";
  String get shortBreakLen => prefs.getString(_shortBreakLenKey) ?? "5";

  Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }
}
