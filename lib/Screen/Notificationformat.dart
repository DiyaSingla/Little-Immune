import 'package:flutter/material.dart';
import 'package:little_immune/util/VaccineNotificationInfo.dart';
import '../util/appLayout.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationFormat extends StatelessWidget {
  const NotificationFormat({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.3,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 40, left: 70),
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 97, 148),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(padding: EdgeInsets.only(top: 70)),
                      Flexible(
                        child: Container(
                          width: 1000,
                          height: 70,
                          color: Color.fromARGB(232, 118, 216, 14),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Notification',
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}









/*class NotificationFormat extends StatelessWidget {
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
        height: 200,
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
                          padding: const EdgeInsets.only(left: 70),
                          height: 250,
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(top: 20)),
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      width: 180,
                                      height: 180,
                                      padding: EdgeInsets.all(20),
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                    'Name Of Children',
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 20)),
                                  Text(
                                    'Name of vaccine',
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
                                const Padding(
                                    padding: EdgeInsets.only(top: 100)),
                                Container(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const VaccineNotificationInfo()));
                                      },
                                      color: Colors.white,
                                      child: const Text(
                                        'Information',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 233, 73, 127)),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),*/
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}*/
