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
            onPressed: () => Navigator.pushReplacement(
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
          int days = DateTime.now().difference(dob.toDate()).inDays;
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
                      age: age,
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
      {super.key, required this.list, required this.index, required this.age});
  final List list;
  final int index;
  final String age;

  State<ChildVaccinationSchedulePage> createState() =>
      VaccinationScheduleScreen();
}

class VaccinationScheduleScreen extends State<ChildVaccinationSchedulePage> {
  List searchResult = [];

  void initState() {
    super.initState();
    searchDueVaccine(widget.age);
  }

  void searchDueVaccine(String age) async {
    final result = await FirebaseFirestore.instance
        .collection('Vaccines')
        .where("from", isGreaterThanOrEqualTo: age)
        .where('from', isNotEqualTo: "At Birth")
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Vaccination Schedule for ' + widget.list[widget.index]['name']),
      ),
      body: ListView.builder(
        itemCount: searchResult.length,
        itemBuilder: (context, index) {
          return VaccineList(
            record: searchResult,
            index: index,
          );
        },
      ),
    );
  }
}
