import 'package:flutter/material.dart';
import 'package:little_immune/util/child_list.dart';
import 'package:little_immune/util/form.dart';
import '../util/appLayout.dart';

class ChildAdded extends StatelessWidget {
  const ChildAdded({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.3,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 70),
                      height: 180,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 97, 148),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: AssetImage('images/dashboardimg.png'),
                              )),
                        ),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(top: 130, left: 40),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyCustomForm(
                                              email: email,
                                            )));
                              },
                              color: Colors.blue,
                              child: const Text(
                                'Add Child',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                              right: 40,
                              top: 130,
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChildListPage(
                                                email: email,
                                              )));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue),
                                child: const Text(' View All')))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
