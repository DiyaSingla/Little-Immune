import 'package:flutter/material.dart';
import 'package:little_immune/Screen/vaccineInfoNotifyFormat.dart';

class VaccineNotificationInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 165, 186),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 97, 148),
          title: const Text('FAQ'),
          actions: [
            IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                onPressed: () {},
                icon: Icon(Icons.settings))
          ],
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              // Navigate to about screen

              icon: Icon(Icons.arrow_back))),
      body: SingleChildScrollView(
        child: Row(
          children: [
            VaccineNotificationFormat(),
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
