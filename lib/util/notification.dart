import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/dashboard.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:mailer/mailer.dart';
//import 'package:mailer/smtp_server.dart';

class Notify extends StatefulWidget {
  const Notify({super.key, required this.email});
  final String email;
  @override
  State<Notify> createState() => NotifyState();
}

class NotifyState extends State<Notify> {
  @override
  void initState() {
    super.initState();

// 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

// 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          // LocalNotificationService.display(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}



/*class Notifications extends StatelessWidget {
  /*Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('messageId', message.messageId!);

    List<String> notifications = prefs.getStringList('notifications') ?? [];
    notifications
        .add('${message.notification!.title}: ${message.notification!.body}');

    await prefs.setStringList('notifications', notifications);
  }*/

  /*void noti() async {
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
  }*/

  /*List<String> notifications = [];
  Notifications({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    //noti();
    return Scaffold(
      backgroundColor: Colors.white,
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
  }*/
}*/
