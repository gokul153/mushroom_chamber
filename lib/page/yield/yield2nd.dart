//tried notification but did not work

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';

class HPage extends StatefulWidget {
  const HPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HPageState createState() => _HPageState();
}

class _HPageState extends State<HPage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  Future<void> initializeTimeZones() async {
    tz.initializeTimeZones();
  }

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Watering Reminder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => scheduleReminder(),
              child: const Text('Set Reminder'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scheduleReminder() async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final now = tz.TZDateTime.now(tz.local);
      final selectedDateTime = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'crop_watering_channel',
        'Crop Watering',
        //'Reminds you to water the crops.',
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Water the crops!',
        'It\'s time to water your crops.',
        selectedDateTime,
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        // ignore: deprecated_member_use
        androidAllowWhileIdle: true,
      );

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Reminder Set'),
          content: const Text('Crop watering reminder scheduled successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
