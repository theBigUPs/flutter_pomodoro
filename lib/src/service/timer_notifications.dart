import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class TimerNotifications {
  Future<void> showNotification(
      {required String title, required String body}) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Initialize settings for Android and iOS
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    //var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      //iOS: initializationSettingsIOS,
    );

    // Initialize the plugin
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (String? payload) async {
      //   // Handle notification click
      // },
    );
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      //'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );
    //var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      //iOS: iOSPlatformChannelSpecifics,
    );

    // Schedule the notification to be shown after 5 seconds
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
