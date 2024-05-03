import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static final _notification = FlutterLocalNotificationsPlugin();

  static init() async {
    await _notification.initialize(const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings()));
    tz.initializeTimeZones();
  }

  static scheduledNotification(String title, String body, DateTime time) async {
    if (time.isAfter(DateTime.now())) {
      var androidNotificationDetails = const AndroidNotificationDetails(
          'important_notifications', 'taskify',
          importance: Importance.max, priority: Priority.high);
      var iosNotificationDetails = const DarwinNotificationDetails();
      var notificationDetails = NotificationDetails(
          android: androidNotificationDetails, iOS: iosNotificationDetails);
      await _notification.zonedSchedule(0, title, body,
          tz.TZDateTime.from(time, tz.local), notificationDetails,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
    } else {}
  }
}
