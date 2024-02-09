import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/src/service/service_provider.dart';
import 'package:flutter_pomodoro/src/service/user_settings.dart';
import 'package:provider/provider.dart';

class PomodoroTimerViewModel with ChangeNotifier {
  String minute = "25";
  String second = "00";
  int totalSeconds = 5;
  Timer? _timer;
  bool ispaused = false;
  IconData startPauseIcon = Icons.arrow_right;
  int progress = 0;

  bool autoResume = false;
  bool notification = true;
  String pomolen = "25";
  String shortlen = "5";
  String longlen = "15";

  List<IconData> progressIcons =
      List.filled(4, Icons.fiber_manual_record_outlined);
  IconData stateIcon = Icons.work_history;
  String stateText = "   Focus";
  Color mainColor = const Color(0xff720000);
  Color secondaryColor = const Color(0xff180000);
  List<Color> main = [
    const Color(0xff720000),
    const Color(0xff0f6b35),
    const Color(0xff367ab5)
  ];
  List<Color> secondary = [
    const Color(0xff180000),
    const Color(0xff03170b),
    const Color(0xff0b1a26)
  ];

  void startTimer(BuildContext context) {
    minute = "${totalSeconds ~/ 60}".padLeft(2, "0");
    second = "${totalSeconds % 60}".padLeft(2, "0");

    notifyListeners();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (totalSeconds == 0) {
          pomodoroProgress(context);
          progress++;
        } else if (totalSeconds == 1) {
          //showNotification(title: "hey", body: "hey", context: context);
          totalSeconds--;
          minute = "${totalSeconds ~/ 60}".padLeft(2, "0");
          second = "${totalSeconds % 60}".padLeft(2, "0");
          notifyListeners();
        } else {
          totalSeconds--;
          minute = "${totalSeconds ~/ 60}".padLeft(2, "0");
          second = "${totalSeconds % 60}".padLeft(2, "0");
          notifyListeners();
        }
      },
    );
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  void startStopTimer(BuildContext context) {
    if (ispaused) {
      cancelTimer();
      startPauseIcon = Icons.arrow_right;
      notifyListeners();
    } else {
      cancelTimer();
      startPauseIcon = Icons.pause;
      startTimer(context);
    }

    ispaused = !ispaused;
  }

  void pomodoroProgress(BuildContext context) {
    if (progress == 7) {
      totalSeconds = 7;
      stateIcon = Icons.work_history;
      stateText = "   Focus";
      progressIcons = List.filled(4, Icons.fiber_manual_record_outlined);
      mainColor = main[0];
      secondaryColor = secondary[0];
      progress = -1;
    } else if (progress == 6) {
      totalSeconds = int.parse(longlen);
      progressIcons[progress ~/ 2] = Icons.fiber_manual_record_rounded;
      stateIcon = Icons.coffee;
      stateText = "   Long Break";
      mainColor = main[2];
      secondaryColor = secondary[2];
    } else if (progress % 2 == 0) {
      totalSeconds = int.parse(shortlen);
      progressIcons[progress ~/ 2] = Icons.fiber_manual_record_rounded;
      stateIcon = Icons.coffee;
      stateText = "   Break";
      mainColor = main[1];
      secondaryColor = secondary[1];
    } else {
      totalSeconds = int.parse(pomolen);
      stateIcon = Icons.work_history;
      stateText = "   Focus";
      mainColor = main[0];
      secondaryColor = secondary[0];
    }

    minute = "${totalSeconds ~/ 60}".padLeft(2, "0");
    second = "${totalSeconds % 60}".padLeft(2, "0");
    //notifyListeners();
    autoResume ? notifyListeners() : startStopTimer(context);
    notification
        ? showNotification(title: stateText.trim(), body: "", context: context)
        : null;
  }

  Future<void> getSettings(BuildContext context) async {
    UserSettings userSettings = Provider.of(context, listen: false);
    await userSettings.init();
    pomolen = userSettings.pomoLen;
    shortlen = userSettings.shortBreakLen;
    longlen = userSettings.longBreakLen;
    autoResume = userSettings.autoResume;
    notification = userSettings.notification;
    minute = pomolen;
  }

  void showNotification(
      {required String title,
      required String body,
      required BuildContext context}) async {
    final serviceProvider =
        Provider.of<ServiceProvider>(context, listen: false);
    serviceProvider.timerNotifications
        .showNotification(title: title, body: body);
  }
}
