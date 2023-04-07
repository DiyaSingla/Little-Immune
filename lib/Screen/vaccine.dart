import 'package:flutter/material.dart';
import '../util/appLayout.dart';

class Vaccine extends StatelessWidget {
  const Vaccine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
        width: size.width * 0.3,
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
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Name Of Medicine',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Age :',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Dose : ',
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
}
