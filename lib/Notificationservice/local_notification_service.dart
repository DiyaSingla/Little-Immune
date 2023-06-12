//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//import 'package:flutter/cupertino.dart';

//import 'dart:io' show Platform;

/*class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
          onDidReceiveLocalNotification: (int id, String? title, String? body,
              String? payload) async {
            onSelectNotification(payload);
          },
        );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: Platform.isIOS ? initializationSettingsIOS : null,
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        onSelectNotification(payload);
      },
    );
  }

  static void onSelectNotification(String? payload) {
    print("onSelectNotification");
    if (payload != null && payload.isNotEmpty) {
      print("Router Value1234 $payload");

      // Navigate to desired screen using payload
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => DemoScreen(
      //       id: payload,
      //     ),
      //   ),
      // );
    }
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      const AndroidNotificationDetails notificationDetailsAndroid =
          AndroidNotificationDetails(
        'pushnotificationapp',
        'pushnotificationappchannel',
        importance: Importance.max,
        priority: Priority.high,
      );

      const IOSNotificationDetails notificationDetailsIOS =
          IOSNotificationDetails();

      const NotificationDetails notificationDetails = NotificationDetails(
        android: notificationDetailsAndroid,
        iOS: Platform.isIOS ? notificationDetailsIOS : null,
      );

      await _notificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } catch (e) {
      print(e);
    }
  }
}*/























/*class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    _notificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      const AndroidNotificationDetails notificationDetailsAndroid =
          AndroidNotificationDetails(
        'pushnotificationapp',
        'pushnotificationappchannel',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails notificationDetails = NotificationDetails(
        android: notificationDetailsAndroid,
      );

      await _notificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } catch (e) {
      print(e);
    }
  }
}*/





















/*class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    void _onSelectNotification(String? id) async {
      print("onSelectNotification");
      if (id!.isNotEmpty) {
        print("Router Value1234 $id");

        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => DemoScreen(
        //       id: id,
        //     ),
        //   ),
        // );
      }
    }
    _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: _onSelectNotification,
    );
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}*/
