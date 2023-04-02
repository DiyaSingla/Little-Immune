import 'package:flutter/material.dart';
import 'dart:async';
import 'package:little_immune/signin.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
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
              gradient: LinearGradient(colors: [Colors.white, Colors.white10]),
              image: DecorationImage(
                image: AssetImage('images/Liitle_IMMUNE.png'),
                //fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
