import 'package:flutter/material.dart';

class PomodoroSettingsViewModel with ChangeNotifier {
  bool autoResume = false;
  bool notification = true;
  void updateSwitch(String key) {
    if (key == "autoresumekey") {
      autoResume = !autoResume;
    } else {
      notification = !notification;
    }
    notifyListeners();
  }

  bool assignSwitch(String key) {
    if (key == "autoresumekey") {
      return autoResume;
    }
    return notification;
  }

  Future<void> saveSettings() async {}
}
