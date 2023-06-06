import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/Screen/stakeholder1page.dart';
import 'package:little_immune/Screen/stakeholderUpdate.dart';

import '../firebase_options.dart';

class VaccineOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 97, 148),
        title: Text('Vaccine Editing Option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("To Add New Vaccine"),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 250, 97, 148),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VaccineForm()),
                );
              },
              child: Text('Vaccine Add'),
            ),
            SizedBox(
              height: 30,
            ),
            Text("To Update Vaccine Information"),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 250, 97, 148),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VaccineUpdateScreen()),
                );
              },
              child: Text('Vaccine Update'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VaccineOption(),
  ));
}
