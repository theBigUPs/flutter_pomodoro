import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/src/service/user_settings.dart';
import 'package:provider/provider.dart';

class PomodoroSettingsViewModel with ChangeNotifier {
  bool autoResume = false;
  bool notification = true;
  String pomolen = "";
  String shortlen = "";
  String longlen = "";
  void updateSwitch(String key, BuildContext context) {
    if (key == "autoresumekey") {
      autoResume = !autoResume;
      saveBoolSettings(context, key, autoResume);
    } else {
      notification = !notification;
      saveBoolSettings(context, key, notification);
    }
    notifyListeners();
  }

  bool assignSwitch(String key) {
    if (key == "autoresumekey") {
      return autoResume;
    }
    return notification;
  }

  Future<void> initSettings(BuildContext context) async {
    UserSettings userSettings = Provider.of(context, listen: false);
    await userSettings.init();
  }

  Future<void> getSettings(BuildContext context) async {
    UserSettings userSettings = Provider.of(context, listen: false);
    pomolen = userSettings.pomoLen;
    shortlen = userSettings.shortBreakLen;
    longlen = userSettings.longBreakLen;
    autoResume = userSettings.autoResume;
    notification = userSettings.notification;
  }

  Future<void> saveStringSettings(TextEditingController controller,
      BuildContext context, String key) async {
    UserSettings userSettings = Provider.of(context, listen: false);

    await userSettings.setString(key, controller.text);
  }

  Future<void> saveBoolSettings(
      BuildContext context, String key, bool value) async {
    UserSettings userSettings = Provider.of(context, listen: false);

    await userSettings.setBool(key, value);
  }
}
