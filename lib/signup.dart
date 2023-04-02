import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/dashboard.dart';
import 'package:little_immune/reusable_widget.dart';
import 'package:little_immune/signin.dart';
import 'package:little_immune/util/appLayout.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 247, 17, 136),
            Color.fromARGB(255, 250, 97, 148),
            Color.fromARGB(255, 249, 147, 181)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding:
                EdgeInsets.only(left: 20, top: size.height * 0.1, right: 20),
            child: Column(
              children: <Widget>[
                logoWidget("images/Liitle_IMMUNE.png"),
                const SizedBox(
                  height: 20,
                  width: 20,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () async {
                  Future<bool> userExists = doesUserExist(
                      _emailTextController.text, _passwordTextController.text);
                  if (await userExists) {
                    print("user exists");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('This email is already registered')),
                    );
                  } else {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("New Account Created")),
                      );
                      print("Created New Account");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "Error ${error.toString().split(']')[1]}")),
                      );
                      print("Error ${error.toString()}");
                    });
                  }
                }),
              ],
            ),
          ))),
    );
  }

  Future<bool> doesUserExist(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password:
            password, // This can be empty as we're only checking if user exists
      );
      // If signInWithEmailAndPassword succeeds, user already exists
      return true;
    } on FirebaseAuthException catch (e) {
      // If signInWithEmailAndPassword fails with user-not-found error, user doesn't exist
      if (e.code == 'user-not-found') {
        return false;
      }
    }
    return true;
  }
}
