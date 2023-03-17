import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/dashboard.dart';
import 'package:little_immune/signup.dart';

import 'reusable_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.red,
          Color.fromARGB(255, 250, 97, 148),
          Color.fromARGB(255, 249, 147, 181)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("images/logo.jpg"),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Username", Icons.person_outline, false,
                  _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
                  _passwordTextController),
              SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              signUpOption()
            ],
          ),
        )),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don;t have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
