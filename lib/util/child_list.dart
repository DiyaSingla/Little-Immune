import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:little_immune/dashboard.dart';

import '../Screen/vaccine_list_screen.dart';

class ChildListPage extends StatefulWidget {
  const ChildListPage({super.key, required this.email});
  final String email;

  @override
  _ChildListPageState createState() => _ChildListPageState();
}

class _ChildListPageState extends State<ChildListPage> {
  List searchResult = [];
  String age = "";
  int days = 0;

  void searchChild(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('Child')
        .where('email', isEqualTo: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    searchChild(widget.email);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child List'),
        backgroundColor: const Color.fromARGB(255, 238, 74, 128),
        leading: IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Dashboard(
                          email: widget.email,
                        ))),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
        itemCount: searchResult.length,
        itemBuilder: (BuildContext context, int index) {
          String name = searchResult[index]['name'];
          Timestamp dob = searchResult[index]['dob'];
          String gender = searchResult[index]['gender'];
          days = DateTime.now().difference(dob.toDate()).inDays;
          CalculateAge(days);
          return Card(
            surfaceTintColor: Color.fromARGB(255, 252, 145, 181),
            child: ListTile(
              leading: const Icon(Icons.child_care),
              title: Text(name),
              subtitle: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(DateFormat('yyyy-MM-dd')
                          .format(dob.toDate())
                          .toString()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(age),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(gender),
                    ),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChildVaccinationSchedulePage(
                      list: searchResult,
                      index: index,
                      days: days,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void CalculateAge(int days) {
    if (days >= 365) {
      age = '${days ~/ 365} years';
    } else if (days >= 31) {
      age = '${days ~/ 31} months';
    } else if (days >= 7) {
      age = '${days ~/ 7} weeks';
    } else {
      age = '$days days';
    }
  }
}

class ChildVaccinationSchedulePage extends StatefulWidget {
  ChildVaccinationSchedulePage(
      {super.key, required this.list, required this.index, required this.days});
  final List list;
  final int index;
  final int days;

  State<ChildVaccinationSchedulePage> createState() =>
      VaccinationScheduleScreen();
}

class VaccinationScheduleScreen extends State<ChildVaccinationSchedulePage> {
  List searchResult = [];
  List dueVaccine = [];

  void initState() {
    super.initState();
    searchDueVaccine(widget.days);
  }

  void searchDueVaccine(int days) async {
    final result =
        await FirebaseFirestore.instance.collection('Vaccines').get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
      for (var rec in searchResult) {
        int time = CalculateDays(rec['from']);
        if (days <= time) {
          dueVaccine.add(rec);
        }
      }
    });
  }

  int CalculateDays(String time) {
    if (time.startsWith("At")) {
      return 5;
    }
    List lst = time.split(" ");
    int days = 0;
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
        title: Text(
            'Vaccination Schedule for ' + widget.list[widget.index]['name']),
      ),
      body: ListView.builder(
        itemCount: dueVaccine.length,
        itemBuilder: (context, index) {
          return VaccineList(
            record: dueVaccine,
            index: index,
          );
        },
      ),
    );
  }
}
