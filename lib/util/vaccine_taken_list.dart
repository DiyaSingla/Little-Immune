import 'package:flutter/material.dart';
import 'package:little_immune/Screen/vaccine.dart';
import 'package:little_immune/Screen/vaccine_list_screen.dart';
import 'package:little_immune/dashboard.dart';

class VaccineList extends StatelessWidget {
  const VaccineList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 250, 97, 148),
            title: const Text('Vaccine List'),
            actions: [
              IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                // Navigate to about screen

                icon: Icon(Icons.arrow_back))),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(top: 10, left: 40),
          child: Column(
            children: const [
              Vaccine(),
              SizedBox(
                height: 10,
              ),
              Vaccine(),
              SizedBox(
                height: 10,
              ),
              Vaccine(),
              SizedBox(
                height: 10,
              ),
              Vaccine(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
