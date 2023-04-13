import 'package:flutter/material.dart';
import 'package:little_immune/util/VaccineNotificationInfo.dart';
import '../util/appLayout.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationFormat extends StatelessWidget {
  const NotificationFormat({Key? key}) : super(key: key);

//   Future<dynamic> onDidReceiveLocalNotification(
//     int id, String title, String body, String payload) async {
//   // Handle the notification when it is received while the app is in the foreground
// }

// Future<dynamic> onSelectNotification(String payload) async {
//   // Handle the notification when the user taps on it
// }

//  IOSInitializationSettings({required Future Function(int id, String title, String body, String payload) onDidReceiveLocalNotification}) {}

//  IOSNotificationDetails() {}

// Future<void> Notification() async {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

//     var initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');

// var initializationSettingsIOS = IOSInitializationSettings(
//     onDidReceiveLocalNotification: onDidReceiveLocalNotification);

// var initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

// await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//     onSelectNotification: onSelectNotification);

//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//     'your channel id', 'your channel name',
//     importance: Importance.max, priority: Priority.high);

// var iOSPlatformChannelSpecifics = IOSNotificationDetails();

// var platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics);

// await flutterLocalNotificationsPlugin.show(
//     0, 'New Notification', 'Flutter Local Notification', platformChannelSpecifics,
//     payload: 'item x');

//     SharedPreferences prefs = await SharedPreferences.getInstance();

// List<String> notifications = prefs.getStringList('notifications') ?? [];
// notifications.add('New Notification');

// await prefs.setStringList('notifications', notifications);
// }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
        width: size.width * 0.8,
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 70),
                          height: 250,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 97, 148),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      width: 180,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.blue,
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/child_vaccine.jpg'),
                                          )),
                                    ),
                                  ),
                                ]),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 20)),
                                  Text(
                                    'Name Of Medicine',
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 20)),
                                  Text(
                                    'Age :',
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 20)),
                                  Text(
                                    'Dose : ',
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 20)),
                                  Text(
                                    'Dose Remained: ',
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 20)),
                                  Text(
                                    'Next Dose : ',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 100)),
                                Container(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VaccineNotificationInfo()));
                                      },
                                      child: Text(
                                        'Information',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 233, 73, 127)),
                                      ),
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
