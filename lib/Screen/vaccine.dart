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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Vaccine: ABC',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Age : 1 yr',
                          textAlign: TextAlign.right,
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Text(
                          'Dose : 2 drops',
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
