import 'package:flutter/material.dart';
import 'package:little_immune/Screen/childInfo.dart';
import 'package:little_immune/Screen/vaccine.dart';
import 'package:little_immune/vaccine_search.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.email});
  final String email;

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirebaseSearchScreen()));
                  },
                  child: Text(
                    'Search Vaccine',
                    style: TextStyle(color: Colors.pink, fontSize: 15),
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
                  Vaccine(),
                  SizedBox(
                    width: 10,
                  ),
                  Vaccine(),
                  SizedBox(
                    width: 10,
                  ),
                  Vaccine(),
                  SizedBox(
                    width: 10,
                  ),
                  Vaccine(),
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
          ChildAdded(
            email: email,
          ),
        ],
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:little_immune/Screen/childInfo.dart';
// import 'package:little_immune/Screen/vaccine.dart';
// import 'package:little_immune/vaccine_search.dart';

// import '../util/vaccine_taken_list.dart';

// class Home extends StatelessWidget {
//   Home({super.key, required this.email});
//   final String email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Container(
//             padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Vaccine List',
//                   selectionColor: Colors.black,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 MaterialButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => FirebaseSearchScreen()));
//                   },
//                   child: Text(
//                     'Search Vaccine',
//                     style: TextStyle(color: Colors.pink, fontSize: 15),
//                   ),
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//             width: 40,
//           ),
//           SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.only(top: 10, left: 40),
//               child: HomePage()),
//           const SizedBox(
//             height: 10,
//             width: 40,
//           ),
//           Container(
//             padding: const EdgeInsets.only(top: 10, left: 40),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Text(
//                   'Child Added',
//                   selectionColor: Colors.black,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//             width: 40,
//           ),
//           ChildAdded(
//             email: email,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => HomeScreen();
// }

// class HomeScreen extends State<HomePage> {
//   List searchResult = [];

//   @override
//   void initState() {
//     super.initState();
//     getAllData();
//   }

//   void getAllData() async {
//     final result =
//         await FirebaseFirestore.instance.collection('Vaccines').get();

//     setState(() {
//       searchResult = result.docs.map((e) => e.data()).toList();
//     });
//   }

//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: searchResult.length,
//       itemBuilder: (context, index) {
//         return VaccineList(
//           record: searchResult,
//           index: index,
//         );
//       },
//     );
//   }
// }
