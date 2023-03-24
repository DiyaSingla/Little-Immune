import 'package:flutter/material.dart';
import 'package:little_immune/Screen/childAdded.dart';
import 'package:little_immune/Screen/vaccine.dart';
import 'package:little_immune/util/vaccine_taken_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vaccine List',
                  selectionColor: Colors.black,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VaccineList()));
                  },
                  child: Text(
                    'view all',
                    style: TextStyle(
                        color: Color.fromARGB(255, 172, 65, 205), fontSize: 15),
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
            width: 40,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 10, left: 40),
              child: Row(
                children: const [
                  VaccineScreen(),
                  SizedBox(
                    width: 10,
                  ),
                  VaccineScreen(),
                  SizedBox(
                    width: 10,
                  ),
                  VaccineScreen(),
                  SizedBox(
                    width: 10,
                  ),
                  VaccineScreen(),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
            width: 40,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Child Added',
                  selectionColor: Colors.black,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
            width: 40,
          ),
          ChildAdded(),
        ],
      ),
    );
  }
}
