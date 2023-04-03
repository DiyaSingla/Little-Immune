import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/dashboard.dart';

class ChildListPage extends StatefulWidget {
  const ChildListPage({super.key, required this.email});
  final String email;

  @override
  _ChildListPageState createState() => _ChildListPageState();
}

class _ChildListPageState extends State<ChildListPage> {
  List searchResult = [];

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
        title: Text('Child List'),
        backgroundColor: Color.fromARGB(255, 238, 74, 128),
        leading: IconButton(
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Dashboard(
                          email: widget.email,
                        ))),
            icon: Icon(Icons.arrow_back)),
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.centerLeft,
        //           end: Alignment.centerRight,
        //           colors: <Color>[Colors.purple, Colors.blue])),
        //)
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 240, 105, 150),
              Color.fromARGB(255, 246, 149, 181),
              Colors.white
            ])),
        child: ListView.builder(
          itemCount: searchResult.length,
          itemBuilder: (BuildContext context, int index) {
            String name = searchResult[index]['name'];
            Timestamp dob = searchResult[index]['dob'];
            String gender = searchResult[index]['gender'];
            return Card(
              child: ListTile(
                leading: Icon(Icons.child_care),
                title: Text(name),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(name),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(dob.toString()),
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
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChildVaccinationSchedulePage(
                          list: searchResult, index: index),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChildVaccinationSchedulePage extends StatelessWidget {
  ChildVaccinationSchedulePage({required this.list, required this.index});
  final List list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination Schedule for ' + list[index]['name']),
        backgroundColor: Color.fromARGB(255, 246, 93, 144),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          // String key = list.keys.elementAt(index);
          // dynamic value = profile[key];
          return Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 247, 247, 246),
                    Color.fromARGB(255, 255, 135, 165)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "abc",
                      // (Timestamp.now().toDate().difference(list[index]['dob']))
                      //     .inDays
                      //     .toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 42, 41, 41),
                      ),
                    ),
                    subtitle: Text(
                      list[index]['gender'],
                      style: TextStyle(
                        color: Color.fromARGB(255, 77, 76, 76),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class _ChildListPageState extends State<ChildListPage> {
//   final List<String> childNames = ['Alice', 'Bob', 'Charlie'];
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 18, 185, 222),
//               Color.fromARGB(255, 207, 132, 238),
//               Color.fromARGB(255, 171, 248, 194),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               Container(
//                 child: SizedBox(
//                   height: 150,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Colors.blue,
//                           image: const DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage('images/child_vaccine.jpg'),
//                           )),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 5,
//                         child: Container(
//                           color: Colors.white,
//                           child: Center(child: Text('Right compartment')),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                     // Other content here
//                     ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
