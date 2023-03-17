import 'package:flutter/material.dart';
import 'dart:async';

import 'package:little_immune/signin.dart';

class MyLogoPage extends StatefulWidget {
  @override
  _MyLogoPageState createState() => _MyLogoPageState();
}

class _MyLogoPageState extends State<MyLogoPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      },
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 2, 52, 94),
                Color.fromARGB(255, 11, 95, 163)
              ]),
              image: DecorationImage(
                image: AssetImage('images/logo.jpg'),
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
