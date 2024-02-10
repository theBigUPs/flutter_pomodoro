import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/src/service/service_provider.dart';
import 'package:provider/provider.dart';

class PomodoroSettingsViewModel with ChangeNotifier {
  bool autoResume = false;
  bool notification = true;
  String pomolen = "";
  String shortlen = "";
  String longlen = "";
  bool loaded = false;
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
    final serviceProvider =
        Provider.of<ServiceProvider>(context, listen: false);
    var userSettings = serviceProvider.userSettings;
    await userSettings.init();
  }

  Future<void> getSettings(BuildContext context) async {
    final serviceProvider =
        Provider.of<ServiceProvider>(context, listen: false);
    var userSettings = serviceProvider.userSettings;
    await userSettings.init();
    pomolen = userSettings.pomoLen;
    shortlen = userSettings.shortBreakLen;
    longlen = userSettings.longBreakLen;
    autoResume = userSettings.autoResume;
    notification = userSettings.notification;
    loaded = true;
    notifyListeners();
  }

  Future<void> saveStringSettings(TextEditingController controller,
      BuildContext context, String key) async {
    final serviceProvider =
        Provider.of<ServiceProvider>(context, listen: false);
    var userSettings = serviceProvider.userSettings;

    await userSettings.setString(key, controller.text);
    print("saved : $key : ${controller.text}");
  }

  Future<void> saveBoolSettings(
      BuildContext context, String key, bool value) async {
    final serviceProvider =
        Provider.of<ServiceProvider>(context, listen: false);
    var userSettings = serviceProvider.userSettings;

    await userSettings.setBool(key, value);
    print("sdf");
  }
}
