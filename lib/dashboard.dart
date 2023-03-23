import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/Screen/vaccine.dart';
import 'package:little_immune/signin.dart';

import 'Screen/childAdded.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                onPressed: () {},
                icon: Icon(Icons.settings))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    //color: Colors.blue,
                    gradient: LinearGradient(colors: [
                  Colors.red,
                  Color.fromARGB(255, 250, 97, 148),
                  Color.fromARGB(255, 249, 147, 181)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(children: <Widget>[
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
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to settings screen
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to about screen
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 180, right: 180),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Vaccine List',
                    selectionColor: Colors.black,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'view all',
                    style: TextStyle(
                        color: Color.fromARGB(255, 172, 65, 205), fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
              width: 40,
            ),
            Scrollbar(
              child: Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(top: 10, left: 40),
                    child: Row(
                      children: const [
                        VaccineScreen(),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        VaccineScreen(),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        VaccineScreen(),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        VaccineScreen(),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
              width: 40,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 180, right: 180),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Child Added',
                    selectionColor: Colors.black,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(
                        color: Color.fromARGB(255, 172, 65, 205), fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
              width: 40,
            ),
            ChildAdded(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                label: 'Due Vaccine', icon: Icon(Icons.vaccines)),
            BottomNavigationBarItem(
                label: 'GPS', icon: Icon(Icons.location_pin)),
          ],
        ),
      ),
    );
  }
}
