import 'package:flutter/material.dart';

class VaccineList extends StatelessWidget {
  const VaccineList({Key? key, required this.record, required this.index})
      : super(key: key);
  final List<dynamic> record;
  final int index;

  @override
  Widget build(BuildContext context) {
    String name = record[index]['name'];
    String from = record[index]['from'];
    String to = record[index]['to'];
    String dose = record[index]['dose'];
    List<dynamic> dis = record[index]['diseases'];
    return Card(
      elevation: 3.0,
      child: ListTile(
        leading: SizedBox(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Color.fromARGB(255, 255, 124, 167),
            foregroundColor: Colors.black,
            child: Text(name[0]),
          ),
        ),
        title: Text(
          'Name Of Vaccine : ' '$name',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text('Vaccination Period : ${period(from, to)}',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
          Text('Disease Prevented : ' '$dis',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
          Text('Dose : ' '$dose',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
        ]),
      ),
    );
  }

  String period(String from, String to) {
    if (from == to) {
      return from;
    } else {
      return "$from to $to";
    }
  }
}
