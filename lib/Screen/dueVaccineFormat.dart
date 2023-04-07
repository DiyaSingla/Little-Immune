import 'package:flutter/material.dart';
import 'package:little_immune/util/VaccineNotificationInfo.dart';
import 'package:little_immune/util/appLayout.dart';

class DueVaccineFormat extends StatelessWidget {
  const DueVaccineFormat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
        width: size.width * 0.8,
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 70),
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 97, 148),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(top: 20, left: 10)),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blue,
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'images/child_vaccine.jpg'),
                                    )),
                              ),
                            ),
                          ]),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 20)),
                            Text(
                              'Name Of Medicine',
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 20)),
                            Text(
                              'Age :',
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 20)),
                            Text(
                              'Dose : ',
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 20)),
                            Text(
                              'Dose Remained: ',
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20, top: 20)),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 100)),
                          Container(
                              padding: const EdgeInsets.only(right: 30),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VaccineNotificationInfo()));
                                },
                                child: Text(
                                  'Information',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 233, 73, 127)),
                                ),
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
