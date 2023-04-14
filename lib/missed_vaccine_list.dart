import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/Screen/vaccine_list_screen.dart';
import 'package:little_immune/history.dart';
import 'package:little_immune/util/due_vaccine_list.dart';

class MissedVaccineList extends StatefulWidget {
  const MissedVaccineList({super.key, required this.email});
  final String email;

  @override
  State<MissedVaccineList> createState() => MissedVaccineListScreen();
}

class MissedVaccineListScreen extends State<MissedVaccineList> {
  List searchResult = [];
  List child = [];
  String age = "";

  void initState() {
    super.initState();
    getChild(widget.email);
    for (int i = 0; i < child.length; i++) {
      int days = DateTime.now().difference(child[i]['dob'].toDate()).inDays;
      searchMissedVaccine(CalculateAge(days));
    }
  }

  void searchMissedVaccine(String age) async {
    final result = await FirebaseFirestore.instance
        .collection('Vaccines')
        .where('to', isLessThan: age)
        .get();

    setState(() {
      searchResult.add(result.docs.map((e) => e.data()).toList());
    });
  }

  void getChild(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('Child')
        .where('email', isEqualTo: query)
        .get();

    setState(() {
      child = result.docs.map((e) => e.data()).toList();
    });
  }

  String CalculateAge(int days) {
    if (days >= 365) {
      age = '${days ~/ 365} years';
    } else if (days >= 31) {
      age = '${days ~/ 31} months';
    } else if (days >= 7) {
      age = '${days ~/ 7} weeks';
    } else {
      age = '$days days';
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Missed Vaccines"),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, idx) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          child[idx]['name'],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: searchResult[idx].length,
                        itemBuilder: (context, innerIndex) {
                          return CheckboxListTile(
                            title: Text(searchResult[idx][innerIndex][
                                'name']), // Modify this line to get the vaccine_name property from the data
                            value: false,
                            onChanged: (bool? isChecked) {
                              _itemChecked(
                                  isChecked!,
                                  searchResult[idx][
                                      innerIndex]); // Modify this line to pass the entire data object to _itemChecked method
                              if (isChecked == false) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VaccineList(
                                      record: searchResult,
                                      index: idx,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      )
                    ]);
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
        selectedItemColor: Color.fromARGB(255, 212, 57, 145),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int number) {
    setState(() {
      _selectedIndex = number;
    });

    if (number == 1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DueVaccineList(
                    email: widget.email,
                  )));
    }

    if (number == 2) {
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
}
