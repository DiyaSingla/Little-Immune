import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../util/appLayout.dart';

class VaccineScreen extends StatelessWidget {
  const VaccineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
        width: size.width * 0.3,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/child_vaccine.jpg'),
                      )),
                ),
                Column(
                  children: const [
                    Text(
                      'Name Of Medicine',
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'Age :',
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'Dose : ',
                      textAlign: TextAlign.right,
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
