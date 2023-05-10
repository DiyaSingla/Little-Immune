import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/Screen/Notificationformat.dart';
import 'package:little_immune/Screen/childInfo.dart';
import 'package:little_immune/vaccine_search.dart';
import 'package:little_immune/util/vaccineTile.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
            width: 40,
          ),
          NotificationFormat(email: email),
          Container(
            padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Vaccine List',
                  selectionColor: Colors.black,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirebaseSearchScreen()));
                  },
                  color: Colors.white,
                  child: const Text(
                    'Search Vaccine',
                    style: TextStyle(color: Colors.pink, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
            width: 40,
          ),
          const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 10, left: 40),
              child: HomeScreen()),
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
          ChildAdded(
            email: email,
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<dynamic>> getAllData() async {
    final result =
        await FirebaseFirestore.instance.collection('Vaccines').get();
    return result.docs.map((e) => e.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: getAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for data
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle any errors that occur while fetching data
          return Text('Error: ${snapshot.error}');
        } else {
          // Once data is retrieved, render the ListView.builder
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return VaccineTile(
                  record: snapshot.data!,
                  index: index,
                );
              },
            ),
          );
        }
      },
    );
  }
}
