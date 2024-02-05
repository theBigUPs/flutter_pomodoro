import 'package:flutter/foundation.dart';
import 'package:flutter_pomodoro/src/service/timer_notifications.dart';
import 'package:flutter_pomodoro/src/service/user_settings.dart';

class ServiceProvider with ChangeNotifier {
  final TimerNotifications timerNotifications = TimerNotifications();
  final UserSettings userSettings = UserSettings();

  // Add any other services here

  // Notify listeners if needed
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
