import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VaccineForm extends StatefulWidget {
  @override
  _VaccineFormState createState() => _VaccineFormState();
}

class _VaccineFormState extends State<VaccineForm> {
  final _formKey = GlobalKey<FormState>();
  late String _vaccineName;
  late String _dose;
  late String _From;
  late String _To;
  late List<dynamic> _diseases;
  //late List<dynamic> _StrindID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 97, 148),
        title: Text('Add Vaccine Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Flexible(
                child: Image.asset(
                  'images/vaccine.png',
                  height: 150,
                ),
              ),
              // Replace with your image path
              SizedBox(height: 16.0),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Vaccine Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the vaccine name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _vaccineName = value!;
                    // for(var i in _vaccineName){
                    //   _StrindID.add(i);
                    // }
                  },
                ),
              ),

              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Dose',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the dose';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _dose = value!;
                  },
                ),
              ),

              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Dose From',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the dose from';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _From = value!;
                  },
                ),
              ),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Dose To',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the dose to';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _To = value!;
                  },
                ),
              ),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Diseases (separated by comma)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the diseases';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _diseases = (value!).split(",");
                  },
                ),
              ),

              SizedBox(height: 16.0),
              MaterialButton(
                color: const Color.fromARGB(255, 250, 97, 148),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final user = User(
                      name: _vaccineName,
                      from: _From,
                      to: _To,
                      dose: _dose,
                      diseases: _diseases,
                    );
                    createUser(user);
                    Navigator.pop(context);
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Child Added')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VaccineForm(),
  ));
}

Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('Vaccine').doc();
  user.id = docUser.id;
  final json = user.toJson();
  await docUser.set(json);
}

class User {
  String id;
  final String name;
  final String from;
  final String to;
  final String dose;
  final List<dynamic> diseases;
  //final List StrindID;

  User({
    this.id = '',
    required this.name,
    required this.from,
    required this.to,
    required this.dose,
    required this.diseases,
    //required this.StrindID,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'from': from,
        'to': to,
        'diseases': diseases,
        //'StrindID': StrindID,
      };
}
