import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/Screen/home.dart';
import 'package:little_immune/signin.dart';
import 'package:little_immune/util/apointment.dart';
import 'package:little_immune/util/due_vaccine_list.dart';
import 'package:little_immune/util/faq.dart';
import 'package:little_immune/util/vaccine_taken_list.dart';
import 'package:little_immune/util/child_list.dart';
import 'Screen/childAdded.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<Dashboard> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DueVaccineList()));
    }
    if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Appointment()));
    }
  }

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      body: Home(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 250, 97, 148),
          title: const Text('Little Immune'),
          actions: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  });
                },
                icon: Icon(Icons.logout))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                    //color: Colors.blue,
                    gradient: LinearGradient(colors: [
                  Colors.red,
                  Color.fromARGB(255, 250, 97, 148),
                  Color.fromARGB(255, 249, 147, 181)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(children: const <Widget>[
                  SizedBox(height: 70),
                  CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'View Profile',
                    style: TextStyle(color: Colors.white),
                  )
                ]),
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to home screen
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.calendar_month_outlined),
                    title: Text('Calender View'),
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to home screen
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.child_care_sharp),
                    title: Text('Child List'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChildListPage()),
                      );
                      // Navigate to home screen
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.schedule_outlined),
                    title: Text('Vaccine Schedule'),
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to home screen
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('FAQ'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FrequentlyAsked()));
                      // Navigate to settings screen
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                    onTap: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        print("Signed Out");
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
              label: 'Due Vaccine',
              icon: Icon(Icons.vaccines),
            ),
            BottomNavigationBarItem(
                label: 'Appointment', icon: Icon(Icons.location_pin)),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 212, 57, 145),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
