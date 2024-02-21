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
        title: Text('Administrative Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Image.asset(
                'images/vaccine.png',
              ),
            ),
            // Replace with your image path
            Flexible(
              child: SizedBox(
                height: 20,
              ),
            ),
            Flexible(
              child: Text("To Add New Vaccine"),
            ),
            Flexible(
              child: SizedBox(
                height: 20,
              ),
            ),

            Flexible(
              child: MaterialButton(
                shape: CircleBorder(eccentricity: 1),
                color: Color.fromARGB(255, 240, 250, 97),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VaccineForm()),
                  );
                },
                child: Text('Vaccine Add'),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 20,
              ),
            ),
            Flexible(
              child: Text("To Update Vaccine Information"),
            ),

            Flexible(
              child: SizedBox(
                height: 20,
              ),
            ),
            Flexible(
              child: MaterialButton(
                shape: CircleBorder(eccentricity: 1),
                color: Color.fromARGB(255, 92, 68, 248),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VaccineUpdateScreen()),
                  );
                },
                child: Text('Vaccine Update'),
              ),
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
