import 'package:flutter/material.dart';

class VaccineTile extends StatelessWidget {
  const VaccineTile({Key? key, required this.record, required this.index})
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
    return Row(
      children: [
        Expanded(
            child: ListTile(
          leading: SizedBox(
            child: Image.network(
              "images/child_vaccine.jpg",
              alignment: Alignment.center,
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
        )),
      ],
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
