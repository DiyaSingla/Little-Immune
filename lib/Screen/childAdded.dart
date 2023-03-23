import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:little_immune/util/form.dart';
import '../util/appLayout.dart';

class ChildAdded extends StatelessWidget {
  const ChildAdded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
        width: size.width * 0.3,
        height: 200,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 70),
                    width: 1170,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 97, 148),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 380, top: 100),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyCustomForm()));
                        },
                        child: Text(
                          'Add Child',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,

                        ///onPressed: () {

                        //},
                        //style: MaterialButton.styleFrom(
                        //backgroundColor: Colors.blue),
                        //child: const Text(' Add Child')
                      )),
                  Container(
                      padding: const EdgeInsets.only(
                        left: 700,
                        top: 100,
                      ),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Text(' View All')))
                ],
              ),
            ],
          )
        ]));
  }
}
