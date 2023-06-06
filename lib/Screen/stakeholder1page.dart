import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VaccineForm extends StatefulWidget {
  @override
  _VaccineFormState createState() => _VaccineFormState();
}

class _VaccineFormState extends State<VaccineForm> {
  final _formKey = GlobalKey<FormState>();
  final _vaccineName = TextEditingController();
  final _dose = TextEditingController();
  final _From = TextEditingController();
  final _To = TextEditingController();
  final _diseases = TextEditingController();
  //final List<dynamic> _StrindID;

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
                  controller: _vaccineName,
                  decoration: InputDecoration(
                    labelText: 'Vaccine Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
              ),

              Flexible(
                child: TextFormField(
                  controller: _dose,
                  decoration: InputDecoration(
                    labelText: 'Dose',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
              ),

              Flexible(
                child: TextFormField(
                  controller: _From,
                  decoration: InputDecoration(
                    labelText: 'Dose Duration Start',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: _To,
                  decoration: InputDecoration(
                    labelText: 'Dose Duration End',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: _diseases,
                  decoration: InputDecoration(
                    labelText: 'Diseases (separated by comma)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 16.0),
              MaterialButton(
                color: const Color.fromARGB(255, 250, 97, 148),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final user = User(
                      name: _vaccineName.text,
                      from: _From.text,
                      to: _To.text,
                      dose: _dose.text,
                      diseases: _diseases.text.split(","),
                    );
                    createUser(user);
                    Navigator.pop(context);
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Vaccine Added')),
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

/*void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VaccineForm(),
  ));
}*/

Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('Vaccines').doc();
  String id = docUser.id;
  
  List<String> StrindIDnew = [];
  String res = '';
  for (int i = 0; i <  user.name.length; i++) {
    res = res + user.name[i];
    StrindIDnew.add(res);
  }
  user.StrindID = StrindIDnew;

  final json = user.toJson();
  await docUser.set(json);
}

class User {
  String name;
   String from;
   String to;
   String dose;
  List<dynamic> diseases;
  List<String>? StrindID;

  User({
    required this.name,
    required this.from,
    required this.to,
    required this.dose,
    required this.diseases,
    this.StrindID,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'from': from,
        'to': to,
        'diseases': diseases,
        'StrindID': StrindID,
      };

  static User fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    from: json['from'],
    to: json['to'],
    dose: json['dose'],
    diseases: json['diseases'],
    StrindID:json['StrindID']
  );
}
