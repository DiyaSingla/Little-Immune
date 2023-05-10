//screen to be seen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/history.dart';
import 'package:little_immune/missed_vaccine_list.dart';
import 'package:little_immune/util/due_vaccine_list.dart';

class DueVaccinePage extends StatefulWidget {
  const DueVaccinePage({super.key, required this.email});
  final String email;

  @override
  State<DueVaccinePage> createState() => _dueVaccinePageState();
}

class _dueVaccinePageState extends State<DueVaccinePage> {
  List searchResult = [];
  List child = [];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MissedVaccineList(
                    email: widget.email,
                  )));
    }

    if (index == 2) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => History(
                    email: widget.email,
                    taken: taken,
                  )));
    }
  }

  int _selectedIndex = 0;

  List taken = [];

  void _itemChecked(bool isChecked, String item) {
    setState(() {
      if (isChecked) {
        taken.add(item);
        searchResult.remove(item);
      } else {
        taken.remove(item);
        searchResult.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      Scaffold(
        body: DueVaccineList(
          email: widget.email,
        ),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 97, 148),
          title: const Text('Little Immune'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
                label: 'Due Vaccine',
                icon: Icon(Icons.home),
                backgroundColor: Colors.pink),
            const BottomNavigationBarItem(
              label: 'Missed Vaccine',
              icon: Icon(Icons.vaccines),
            ),
            BottomNavigationBarItem(
              label: "Vaccine Taken",
              icon: Stack(children: [
                Icon(Icons.favorite),
                Positioned(
                    top: -1.0,
                    right: -1.0,
                    child: Stack(
                      children: const [
                        Icon(
                          Icons.brightness_1,
                          size: 12.0,
                          color: Color(0xFF2845E7),
                        ),
                      ],
                    )),
              ]),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 212, 57, 145),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
