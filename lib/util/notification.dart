import 'package:flutter/material.dart';
import 'package:little_immune/Screen/Notificationformat.dart';
import 'package:little_immune/dashboard.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 129, 165),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 97, 148),
          title: const Text('Notification'),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard(
                            email: email,
                          ))),
              // Navigate to about screen

              icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 10, left: 40),
        child: Column(
          children: const [
            NotificationFormat(),
            SizedBox(
              height: 10,
            ),
            NotificationFormat(),
            SizedBox(
              height: 10,
            ),
            NotificationFormat(),
            SizedBox(
              height: 10,
            ),
            NotificationFormat(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
