import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoro/src/service/service_provider.dart';
import 'package:provider/provider.dart';

class PomodoroTimerViewModel with ChangeNotifier {
  String minute = "00";
  String second = "00";
  int total = 0;
  Timer? _timer;

  void startTimer(int len, BuildContext context) {
    total = len;
    minute = "${total ~/ 60}".padLeft(2, "0");
    second = "${total % 60}".padLeft(2, "0");

    notifyListeners();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (total == 0) {
          timer.cancel();
        } else if (total == 1) {
          //showNotification(title: "hey", body: "hey", context: context);
          total--;
          minute = "${total ~/ 60}".padLeft(2, "0");
          second = "${total % 60}".padLeft(2, "0");
          notifyListeners();
        } else {
          total--;
          minute = "${total ~/ 60}".padLeft(2, "0");
          second = "${total % 60}".padLeft(2, "0");
          notifyListeners();
        }
      },
    );
  }

  void cancelTimer() {
    _timer?.cancel();
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
