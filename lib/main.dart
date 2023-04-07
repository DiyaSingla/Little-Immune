import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/logo_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Little Immune',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: "Little Immune"));
  }
}
