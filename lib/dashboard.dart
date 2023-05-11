import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/Screen/home.dart';
import 'package:little_immune/signin.dart';
import 'package:little_immune/util/due_vaccine_list.dart';
import 'package:little_immune/util/faq.dart';
import 'package:little_immune/util/child_list.dart';
import 'package:little_immune/Screen/CalenderView.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.email});
  final String email;

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
          context,
          MaterialPageRoute(
              builder: (context) => DueVaccineList(
                    email: widget.email,
                  )));
    }

    /*if (index == 2) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Notifications(
                    email: widget.email,
                  )));
    }*/
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            //child: widgetOptions.elementAt(_selectedIndex),
            child: Home(
          email: widget.email,
        )),
        appBar: AppBar(
          title: const Text('Little Immune'),
          actions: [
            IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "Signed Out"), // Duration for which the snackbar will be visible
                      ),
                    );
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  });
                },
                icon: const Icon(Icons.logout))
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
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
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
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to home screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.calendar_month_outlined),
                    title: const Text('Calender View'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyCalendarWidget()));
                      // Navigate to home screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.child_care_sharp),
                    title: const Text('Child List'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChildListPage(
                                  email: widget.email,
                                )),
                      );
                      // Navigate to home screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.schedule_outlined),
                    title: const Text('Vaccine Schedule'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DueVaccineList(
                                  email: widget.email,
                                )),
                      );
                      // Navigate to home screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('FAQ'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FrequentlyAsked()));
                      // Navigate to settings screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Log Out'),
                    onTap: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Signed out"), // Duration for which the snackbar will be visible
                          ),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
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
            /*BottomNavigationBarItem(
              label: "Notification",
              icon: Stack(children: [
                const Icon(Icons.favorite),
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
            ),*/
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 212, 57, 145),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
