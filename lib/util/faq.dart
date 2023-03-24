import 'package:flutter/material.dart';

class FrequentlyAsked extends StatelessWidget {
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
          children: const [
            Text(
              'Q1. ',
              style: TextStyle(color: Color.fromARGB(255, 8, 4, 7)),
            ),
            SizedBox(height: 5),
            Text('Ans:',
                style: TextStyle(color: Color.fromARGB(255, 29, 92, 227))),
            SizedBox(height: 10),
            Text(
              'Q2. ',
              style: TextStyle(color: Color.fromARGB(255, 8, 4, 7)),
            ),
            SizedBox(height: 5),
            Text('Ans:',
                style: TextStyle(color: Color.fromARGB(255, 29, 92, 227))),
            SizedBox(height: 10),
            Text('Q3. ', style: TextStyle(color: Color.fromARGB(255, 8, 4, 7))),
            SizedBox(height: 5),
            Text('Ans:',
                style: TextStyle(color: Color.fromARGB(255, 29, 92, 227))),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
