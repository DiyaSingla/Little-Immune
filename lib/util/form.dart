import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final controllerName = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerDob = TextEditingController();
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String _selectedOption = "";
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return MaterialApp(
        title: 'The Child Fill In Form ',
        debugShowCheckedModeBanner: false,
        home: Center(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 250, 97, 148),
                title: Text('Child Form'),
                leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back))),
            body: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: controllerName,
                    // The validator receives the text that the user has entered.
                    decoration: InputDecoration(
                      labelText: "Child Name",
                      filled: true,
                      fillColor: Color.fromARGB(255, 49, 197, 192),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 37, 236, 226)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Child Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DateTimeField(
                    decoration: InputDecoration(
                      labelText: "Select a DOB",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 37, 209, 236)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 133, 227, 242),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    selectedDate: _selectedDate,
                    onDateSelected: (DateTime date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Select your Gender'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        value: 'option1',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                          });
                        },
                      ),
                      Text('Male'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        value: 'option2',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        final user = User(
                            name: controllerName.text,
                            gender: (_selectedOption == 'option1')
                                ? 'male'
                                : 'female',
                            dob: _selectedDate);
                        createUser(user);
                        Navigator.pop(context);
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Child Added')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('Child').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final String gender;
  final DateTime dob;

  User({
    this.id = '',
    required this.name,
    required this.gender,
    required this.dob,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'dob': dob,
      };
}
