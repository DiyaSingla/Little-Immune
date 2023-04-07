import 'package:flutter/material.dart';
import 'package:little_immune/util/appLayout.dart';

class VaccineNotificationFormat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 10, left: 20)),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 70),
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
                                      padding: EdgeInsets.only(top: 20)),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      width: 180,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                      padding:
                                          EdgeInsets.only(left: 20, top: 20)),
                                  Text(
                                    'Name of the Vaccine',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 8, 4, 7),
                                        fontStyle: FontStyle.normal,
                                        fontSize: 40),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Information',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 8, 4, 7),
                                        fontStyle: FontStyle.normal,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
    // TODO: implement build
    throw UnimplementedError();
  }
}
