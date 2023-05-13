import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/dashboard.dart';
import 'package:little_immune/history.dart';
import '../missed_vaccine_list.dart';

class DueVaccineList extends StatefulWidget {
  const DueVaccineList({super.key, required this.email});
  final String email;

  @override
  State<DueVaccineList> createState() => DueVaccineListScreen();
}

class DueVaccineListScreen extends State<DueVaccineList> {
  List<List<dynamic>> searchResult = [];
  List child = [];
  int days = 0;
  List vaccines = [];

  @override
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
        int time = CalculateDays(rec['from']);
        if (age <= time) {
          rec['left'] = time - age;
          res.add(rec);
        }
      }

      searchResult.add(res);
    }
    //earchResult.sort((a,b) => int.parse(a['left']).compare(b['left']));
  }

  int CalculateDays(String time) {
    if (time.startsWith("At")) {
      return 5;
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
          title: const Text("Due Vaccines"),
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
            physics: const ClampingScrollPhysics(),
            itemCount: searchResult[index1].length,
            itemBuilder: (context, index2) {
              return ListTile(
                trailing: Text(child[index1]['name']),
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
              Icon(Icons.vaccines_rounded),
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
              builder: (context) => MissedVaccineList(
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
  void _itemChecked(bool isChecked, List item) {
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






// import 'package:flutter/material.dart';
// import 'package:little_immune/Screen/dueVaccineFormat.dart';
// import 'package:little_immune/dashboard.dart';

// class DueVaccineList extends StatelessWidget {
//   const DueVaccineList({super.key, required this.email});
//   final String email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: const Text('Due Vaccine'),
//             leading: IconButton(
//                 onPressed: () => Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Dashboard(
//                               email: email,
//                             ))),
//                 // Navigate to about screen

//                 icon: Icon(Icons.arrow_back))),
//         body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.only(top: 10, left: 40),
//           child: Column(
//             children: const [
//               DueVaccineFormat(),
//               SizedBox(
//                 height: 10,
//               ),
//               DueVaccineFormat(),
//               SizedBox(
//                 height: 10,
//               ),
//               DueVaccineFormat(),
//               SizedBox(
//                 height: 10,
//               ),
//               DueVaccineFormat(),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ));
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
// import 'package:little_immune/missed_vaccine_list.dart';

// import '../history.dart';

// // Define a class to represent the Vaccine model
// class Vaccine {
//   final String name;
//   final DateFormat ageInWeeks; // Age in weeks when the vaccine is due

//   Vaccine({required this.name, required this.ageInWeeks});
// }

// // Fetch vaccine data from Firestore and calculate upcoming vaccine dates
// Future<List<Vaccine>> fetchUpcomingVaccines(DateTime dateOfBirth) async {
//   List<Vaccine> upcomingVaccines = [];
//   try {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection(
//             'Child') // Replace 'vaccines' with the name of your collection in Firestore
//         .orderBy('dob') // Order by age in weeks ascending
//         .get();

//     for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
//       Vaccine vaccine = Vaccine(
//         name: documentSnapshot['name'],
//         ageInWeeks: documentSnapshot['dob']-DateTime.now(),
//       );

//       // Calculate the upcoming vaccine date based on the child's date of birth
//       DateTime upcomingVaccineDate = dateOfBirth.add(
//         Duration(
//             days: vaccine.ageInWeeks *
//                 7), // Assume 7 days per week for simplicity
//       );

//       // Add the vaccine to the list if it is upcoming (i.e., the date is in the future)
//       if (upcomingVaccineDate.isAfter(DateTime.now())) {
//         upcomingVaccines.add(vaccine);
//       }
//     }
//   } catch (e) {
//     // Handle any errors that may occur during fetching
//     print('Error fetching upcoming vaccines: $e');
//   }

//   return upcomingVaccines;
// }

// class DueVaccineList extends StatefulWidget {
//   const DueVaccineList({super.key, required this.email});
//   final String email;
//   @override
//   _DueVaccineListState createState() => _DueVaccineListState();
// }

// class _DueVaccineListState extends State<DueVaccineList> {
//   List<Vaccine> upcomingVaccines = [];
//   List searchResult = [];
//   @override
//   void initState() {
//     super.initState();
//     // Fetch upcoming vaccines when the app loads
//     fetchVaccines();
//   }

//   Future<void> fetchVaccines() async {
//     // Fetch upcoming vaccines from Firestore
//     List<Vaccine> vaccines = await fetchUpcomingVaccines(DateTime.now());
//     setState(() {
//       upcomingVaccines = vaccines;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Vaccine Reminder'),
//       ),
//       body: Column(
//         children: [
//           Text(
//             'Upcoming Vaccines:',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: upcomingVaccines.length,
//               itemBuilder: (context, index) {
//                 Vaccine vaccine = upcomingVaccines[index];
//                 return ListTile(
//                   title: Text(vaccine.name),
//                   subtitle: Text('Due in ${vaccine.ageInWeeks} weeks'),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             label: "Vaccines Due",
//             icon: Stack(children: [
//               Icon(Icons.vaccines_rounded),
//               Positioned(
//                   top: -1.0,
//                   right: -1.0,
//                   child: Stack(
//                     children: const [
//                       Icon(
//                         Icons.brightness_1,
//                         size: 12.0,
//                         color: Color(0xFF2845E7),
//                       ),
//                     ],
//                   )),
//             ]),
//           ),
//           const BottomNavigationBarItem(
//             label: 'Vaccines Missed',
//             icon: Icon(Icons.warning),
//           ),
//           const BottomNavigationBarItem(
//               label: 'Vaccines Taken',
//               icon: Icon(Icons.done_all),
//               backgroundColor: Colors.pink),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color.fromARGB(255, 212, 57, 145),
//         onTap: _onItemTapped,
//       ),
//     );
//   }

//   void _onItemTapped(int number) {
//     setState(() {
//       _selectedIndex = number;
//     });

//     if (number == 1) {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => MissedVaccineList(
//                     email: widget.email,
//                   )));
//     }

//     if (number == 2) {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => History(
//                     email: widget.email,
//                     taken: taken,
//                   )));
//     }
//   }

//   int _selectedIndex = 0;

//   List taken = [];
//   void _itemChecked(bool isChecked, String item) {
//     setState(() {
//       if (isChecked) {
//         taken.add(item);
//         searchResult.remove(item);
//       } else {
//         taken.remove(item);
//         searchResult.add(item);
//       }
//     });
//   }
// }