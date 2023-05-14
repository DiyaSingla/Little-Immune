import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../util/appLayout.dart';

class NotificationFormat extends StatefulWidget {
  NotificationFormat({super.key, required this.email});
  String email;
  State<NotificationFormat> createState() => notificationText();
}

class notificationText extends State<NotificationFormat> {
  List child = [];
  List vaccines = [];
  int days = 0;
  int min = 100000;
  String vaccine = '';
  String kid = '';
  String message = '';

  void init() {
    super.initState();
  }

  Future<void> getSchedule(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('Child')
        .where('email', isEqualTo: query)
        .get();

    child = result.docs.map((e) => e.data()).toList();

    final result2 =
        await FirebaseFirestore.instance.collection('Vaccines').get();

    vaccines = result2.docs.map((e) => e.data()).toList();

    for (int i = 0; i < child.length; i++) {
      int age = DateTime.now().difference(child[i]['dob'].toDate()).inDays;
      List res = [];

      for (var rec in vaccines) {
        int time = CalculateDays(rec['from']);
        if (age <= time) {
          res.add(rec);
          int DaysLeft = time - age;
          if (DaysLeft < min) {
            min = DaysLeft;
            vaccine = rec['name'];
            kid = child[i]['name'];
          }
        }
      }
      // ignore: prefer_interpolation_to_compose_strings
      message = (kid.isEmpty)
          ? "No due vaccines!"
          : vaccine +
              ' Vaccine due for ' +
              kid +
              " in " +
              min.toString() +
              " days!";
    }
    return null;
  }

  int CalculateDays(String time) {
    if (time.startsWith("At")) {
      return 5;
    }
    List lst = time.split(" ");
    if (lst[1] == "years") {
      days = 365 * int.parse(lst[0]);
    } else if (lst[1] == "months") {
      days = 31 * int.parse(lst[0]);
    } else if (lst[1] == "weeks") {
      days = 7 * int.parse(lst[0]);
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.3,
      height: 100,
      child: FutureBuilder<void>(
        future: getSchedule(widget.email),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 70)),
                                Flexible(
                                  child: Container(
                                    width: 1000,
                                    height: 70,
                                    color: Color.fromARGB(232, 118, 216, 14),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        message,
                                        maxLines: 3,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
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
            );
          }
        },
      ),
    );
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
