import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/signin.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final avatar = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'logo',
          child: SizedBox(
            height: 160,
            child: Image.asset('images/logo.jpg'),
          )),
    );
    final description = Padding(
      padding: EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
            text: 'hello! this is the dashboard',
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
    final buttonLogout = TextButton(
        child: Text(
          'Logout',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            print("Signed Out");
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          });
        });
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[avatar, description, buttonLogout],
        ),
      ),
    ));
  }
}
