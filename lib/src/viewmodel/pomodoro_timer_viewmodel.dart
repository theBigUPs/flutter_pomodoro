import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroTimerViewModel with ChangeNotifier {
  String minute = "00";
  String second = "00";
  int total = 0;
  void startTimer(int len) {
    Timer timer;
    total = len;
    minute =
        "${total ~/ 60}".length == 1 ? "0${total ~/ 60}" : "${total ~/ 60}";
    second = "${total % 60}".length == 1 ? "0${total % 60}" : "${total % 60}";

    notifyListeners();
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (total == 0) {
          timer.cancel();
        } else {
          total--;
          minute = "${total ~/ 60}".length == 1
              ? "0${total ~/ 60}"
              : "${total ~/ 60}";
          second =
              "${total % 60}".length == 1 ? "0${total % 60}" : "${total % 60}";
          notifyListeners();
        }
      },
    );
  }
}
