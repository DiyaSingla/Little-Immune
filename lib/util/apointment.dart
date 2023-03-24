import 'package:flutter/material.dart';
import 'package:little_immune/dashboard.dart';

class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 129, 165),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 97, 148),
          title: const Text('Appointment'),
          actions: [
            IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                onPressed: () {},
                icon: Icon(Icons.settings))
          ],
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard())),
              // Navigate to about screen

              icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(),
    );
  }
}
