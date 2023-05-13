import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/dashboard.dart';
import 'package:little_immune/history.dart';
import 'package:little_immune/util/due_vaccine_list.dart';

class MissedVaccineList extends StatefulWidget {
  const MissedVaccineList({super.key, required this.email});
  final String email;

  @override
  State<MissedVaccineList> createState() => MissedVaccineListScreen();
}

class MissedVaccineListScreen extends State<MissedVaccineList> {
  List<List<dynamic>> searchResult = [];
  List child = [];
  int days = 0;
  List vaccines = [];

  void initState() {
    super.initState();
    getSchedule(widget.email);
  }

  void getSchedule(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('Child')
        .where('email', isEqualTo: query)
        .get();

    child = result.docs.map((e) => e.data()).toList();

    final result2 =
        await FirebaseFirestore.instance.collection('Vaccines').get();

    vaccines = result2.docs.map((e) => e.data()).toList();

    for (int i = 0; i < child.length; i++) {
      int age = DateTime.now().difference(child[i]['dob'].toDate()).inDays;
      List res = [];

      for (var rec in vaccines) {
        int time = CalculateDays(rec['to']);
        if (age > time) {
          res.add(rec);
        }
      }

      searchResult.add(res);
    }
  }

  int CalculateDays(String time) {
    if (time.startsWith("At")) {
      return 0;
    }
    List lst = time.split(" ");
    if (lst[1] == "years") {
      days = 365 * int.parse(lst[0]);
    } else if (lst[1] == "months") {
      days = 31 * int.parse(lst[0]);
    } else if (lst[1] == "weeks") {
      days = 7 * int.parse(lst[0]);
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Missed Vaccines"),
          backgroundColor: Colors.pink,
          leading: IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard(
                            email: widget.email,
                          ))),
              // Navigate to about screen

              icon: const Icon(Icons.arrow_back))),
      body: ListView.builder(
        itemCount: searchResult.length,
        itemBuilder: (context, index1) {
          return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: searchResult[index1].length,
            itemBuilder: (context, index2) {
              return CheckboxListTile(
                value: false,
                onChanged: (value) {
                  setState(() {
                    if (true) {
                      // Remove the vaccine reminder from the current list and add it to the vaccine taken list
                      taken.add(searchResult[index1][index2]);
                      searchResult[index1].removeAt(index2);
                    }
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                secondary: Text(child[index1]['name']),
                title: Text(
                    '${searchResult[index1][index2]['name']}'), // Access the map data by key
                subtitle: Text((searchResult[index1][index2]['from'] ==
                        searchResult[index1][index2]['to'])
                    ? '${searchResult[index1][index2]['from']}'
                    : '${searchResult[index1][index2]['from']}'
                        ' to '
                        '${searchResult[index1][index2]['to']}'), // Access the map data by key
              );
            },
          );
        },
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

    if (number == 0) {
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

  int _selectedIndex = 1;
  List taken = [];

  void _itemChecked(bool isChecked, String item) {
    setState(() {
      if (isChecked) {
        taken.add(item);
        searchResult.remove(item);
      } else {
        taken.remove(item);
        searchResult.add(item as List);
      }
    });
  }
}
