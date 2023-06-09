import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key, required this.email});
  final String email;

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final controllerName = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerDob = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _selectedOption = "";
  DateTime _selectedDate = DateTime.now();
  // DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
        _dateController.text = _selectedDate.toString().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return MaterialApp(
        title: 'Add Child Details',
        debugShowCheckedModeBanner: false,
        home: Center(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 250, 97, 148),
                title: const Text('Add Child Details'),
                leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back))),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset("images/formBaby.png", height: 150),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: controllerName,
                      // The validator receives the text that the user has entered.
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_2_outlined),
                        labelText: "Child Name",
                        filled: true,
                        fillColor: const Color.fromARGB(255, 220, 234, 233),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 26, 28, 28)),
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
                    TextFormField(
                      controller: _dateController,
                      onTap: _selectDate,
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.calendar_month_outlined),
                        labelText: "Date Of Birth",
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 26, 28, 28)),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 220, 234, 233),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Select Gender'),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
                              const Text('Male'),
                              const Icon(
                                Icons.male_outlined,
                                color: Colors.blue,
                              ),
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
                              const Text('Female'),
                              const Icon(
                                Icons.female_outlined,
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ]),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          final user = User(
                              name: controllerName.text,
                              gender: (_selectedOption == 'option1')
                                  ? 'male'
                                  : 'female',
                              dob: _selectedDate,
                              email: widget.email);
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
  final String email;

  User({
    this.id = '',
    required this.name,
    required this.gender,
    required this.dob,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'gender': gender,
        'dob': dob,
        'email': email,
      };
}
