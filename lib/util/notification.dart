import 'package:flutter/material.dart';
import 'package:little_immune/dashboard.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifications extends StatelessWidget {
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('messageId', message.messageId!);

    List<String> notifications = prefs.getStringList('notifications') ?? [];
    notifications
        .add('${message.notification!.title}: ${message.notification!.body}');

    await prefs.setStringList('notifications', notifications);
  }

  void noti() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.setAutoInitEnabled(true);
    FirebaseMessaging.onBackgroundMessage(
        firebaseMessagingBackgroundHandler); // Register background message handler
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  List<String> notifications = [];
  Notifications({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    noti();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 129, 165),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 250, 97, 148),
          title: const Text('Notification'),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard(
                            email: email,
                          ))),
              // Navigate to about screen

              icon: const Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(top: 10, left: 40),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                notifications[index],
                style: const TextStyle(fontSize: 16.0),
              ),
              subtitle: Text(
                'Subtitle of item $index',
                maxLines: 2, // Set maximum number of lines for subtitle
                overflow: TextOverflow.ellipsis, // Handle overflow
              ),
            );
          },
        ),
      ),
    );
  }
}
