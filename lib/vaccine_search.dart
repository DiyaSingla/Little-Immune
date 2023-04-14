import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/Screen/vaccine_list_screen.dart';

class FirebaseSearchScreen extends StatefulWidget {
  const FirebaseSearchScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseSearchScreen> createState() => FirebaseSearchScreenState();
}

class FirebaseSearchScreenState extends State<FirebaseSearchScreen> {
  List searchResult = [];

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  void getAllData() async {
    final result =
        await FirebaseFirestore.instance.collection('Vaccines').get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('Vaccines')
        .where('StrindID', arrayContains: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vaccine List"),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                border: OutlineInputBorder(),
                hintText: "Search Here",
              ),
              onChanged: (query) {
                if (query.isEmpty == true) {
                  getAllData();
                } else {
                  searchFromFirebase(query);
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return VaccineList(
                  record: searchResult,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
