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
            child: Text(name[0]),
            radius: 30,
            backgroundColor: Color.fromARGB(255, 255, 124, 167),
            foregroundColor: Colors.black,
          ),
          //height: 300.0,
          // width: 150.0,
          // child: Image.network(
          //   "images/child_vaccine.jpg",
          //   alignment: Alignment.center,
          // ),
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
    // return SizedBox(
    //     width: size.width * 0.6,
    //     height: 200,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Flexible(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Flexible(
    //                 child: Container(
    //                   padding: EdgeInsets.all(50),
    //                   width: 180,
    //                   height: 180,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(12),
    //                       color: Color.fromARGB(255, 249, 111, 164),
    //                       image: const DecorationImage(
    //                         fit: BoxFit.cover,
    //                         image: AssetImage('images/child_vaccine.jpg'),
    //                       )),
    //                 ),
    //               ),
    //               Flexible(
    //                 child: Column(
    // crossAxisAlignment: CrossAxisAlignment.center,
    // children: [
    //   Padding(padding: EdgeInsets.only(top: 30)),
    //   Text(
    //     'Name Of Vaccine : ' + '$name',
    //     textAlign: TextAlign.right,
    //   ),
    //   Padding(padding: EdgeInsets.only(top: 30)),
    //   Text(
    //     'Vaccination Period : ' + period(from, to),
    //     textAlign: TextAlign.right,
    //   ),
    //   Padding(padding: EdgeInsets.only(top: 30)),
    //   Text(
    //     'Disease Prevented : ' + '$dis',
    //     textAlign: TextAlign.right,
    //   ),
    //   Padding(padding: EdgeInsets.only(top: 30)),
    //   Text(
    //     'Dose : ' + '$dose',
    //     textAlign: TextAlign.right,
    //   ),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ));
  }

  String period(String from, String to) {
    if (from == to) {
      return from;
    } else {
      return "$from to $to";
    }
  }
}
