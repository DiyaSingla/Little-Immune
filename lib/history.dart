import 'package:flutter/material.dart';
import 'package:little_immune/Screen/vaccine_list_screen.dart';
import 'package:little_immune/util/due_vaccine_list.dart';

import 'missed_vaccine_list.dart';

class History extends StatefulWidget {
  const History({super.key, required this.email, required this.taken});
  final String email;
  final List taken;

  @override
  State<History> createState() => HistoryScreen();
}

class HistoryScreen extends State<History> {
  List searchResult = [];
  List child = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // getChild(widget.email);
    //code for due vaccine nikalne ka tarika
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vaccine Taken"),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return VaccineList(
                  record: widget.taken,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Vaccines Due",
            icon: Stack(children: [
              const Icon(Icons.vaccines_rounded),
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
          const BottomNavigationBarItem(
            label: 'Vaccines Missed',
            icon: Icon(Icons.warning),
          ),
          const BottomNavigationBarItem(
              label: 'Vaccines Taken',
              icon: Icon(Icons.done_all),
              backgroundColor: Colors.pink),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 212, 57, 145),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int number) {
    setState(() {
      _selectedIndex = number;
    });

    if (number == 0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DueVaccineList(
                    email: widget.email,
                  )));
    }

    if (number == 1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MissedVaccineList(
                    email: widget.email,
                  )));
    }
  }

  int _selectedIndex = 2;
}
