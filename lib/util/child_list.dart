import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:little_immune/dashboard.dart';

class ChildListPage extends StatefulWidget {
  @override
  _ChildListPageState createState() => _ChildListPageState();
}

class _ChildListPageState extends State<ChildListPage> {
  final List<String> childNames = ['Alice', 'Bob', 'Charlie'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child List'),
        backgroundColor: Color.fromARGB(255, 238, 74, 128),
        leading: IconButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Dashboard())),
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
          itemCount: childNames.length,
          itemBuilder: (BuildContext context, int index) {
            final childName = childNames[index];
            return Card(
              child: ListTile(
                leading: Icon(Icons.child_care),
                title: Text(childName),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Name'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Age'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Gender'),
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChildVaccinationSchedulePage(childName: childName),
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
  final String childName;
  Map<String, dynamic> profile = {
    'name': 'John Doe',
    'email': 'johndoe@example.com',
    'phone': '+1 (555) 123-4567',
    'address': {
      'street': '123 Main St',
      'city': 'Anytown',
      'state': 'CA',
      'zip': '12345'
    }
  };
  ChildVaccinationSchedulePage({required this.childName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination Schedule for $childName'),
        backgroundColor: Color.fromARGB(255, 246, 93, 144),
      ),
      body: ListView.builder(
        itemCount: profile.length,
        itemBuilder: (context, index) {
          String key = profile.keys.elementAt(index);
          dynamic value = profile[key];
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
                      key,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 42, 41, 41),
                      ),
                    ),
                    subtitle: Text(
                      value.toString(),
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
