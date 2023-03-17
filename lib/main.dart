import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Little Immune',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SignIn(),
    );
  }
}
