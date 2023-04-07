import 'package:flutter/material.dart';
import 'package:little_immune/Screen/dueVaccineFormat.dart';
import 'package:little_immune/dashboard.dart';

class DueVaccineList extends StatelessWidget {
  const DueVaccineList({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 165, 186),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 250, 97, 148),
            title: const Text('Due Vaccine'),
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Dashboard(
                              email: email,
                            ))),
                // Navigate to about screen

                icon: Icon(Icons.arrow_back))),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(top: 10, left: 40),
          child: Column(
            children: const [
              DueVaccineFormat(),
              SizedBox(
                height: 10,
              ),
              DueVaccineFormat(),
              SizedBox(
                height: 10,
              ),
              DueVaccineFormat(),
              SizedBox(
                height: 10,
              ),
              DueVaccineFormat(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
