import 'package:flutter/material.dart';

class VaccineForm extends StatefulWidget {
  @override
  _VaccineFormState createState() => _VaccineFormState();
}

class _VaccineFormState extends State<VaccineForm> {
  final _formKey = GlobalKey<FormState>();
  late String _vaccineName;
  late int _dose;
  late int _doseFrom;
  late int _doseTo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 97, 148),
        title: Text('Vaccine Form'),
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
                    _dose = int.parse(value!);
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the dose from';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _doseFrom = int.parse(value!);
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
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the dose to';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _doseTo = int.parse(value!);
                  },
                ),
              ),

              SizedBox(height: 16.0),
              MaterialButton(
                color: const Color.fromARGB(255, 250, 97, 148),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the form data, e.g., save it to a database
                    // or pass it to a function for further processing.
                    print('Vaccine Name: $_vaccineName');
                    print('Dose: $_dose');
                    print('Dose From: $_doseFrom');
                    print('Dose To: $_doseTo');
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
