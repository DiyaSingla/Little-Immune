import 'dart:math';

import 'package:flutter/material.dart';
import 'package:little_immune/util/appLayout.dart';

class VaccineList extends StatelessWidget {
  const VaccineList({Key? key, required this.record, required this.index})
      : super(key: key);
  final List<dynamic> record;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    String name = record[index]['name'];
    String from = record[index]['from'];
    String to = record[index]['to'];
    String dose = record[index]['dose'];
    List<dynamic> dis = record[index]['diseases'];

    Color randomColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

    return SizedBox(
        width: size.width * 0.6,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(50),
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 249, 111, 164),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/child_vaccine.jpg'),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          'Name Of Vaccine : ' + '$name',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          'Vaccination Period : ' + period(from, to),
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          'Disease Prevented : ' + '$dis',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          'Dose : ' + '$dose',
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  String period(String from, String to) {
    if (from == to) {
      return from;
    } else {
      return from + "to" + to;
    }
  }
}
