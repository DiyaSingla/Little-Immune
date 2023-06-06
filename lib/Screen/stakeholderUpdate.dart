import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'stakeholder1page.dart';

class VaccineUpdateScreen extends StatefulWidget {
  // String ID;
  // VaccineUpdateScreen({super.key, required this.ID});
  @override
  //State<VaccineUpdateScreen> createState() => _VaccineUpdateScreenState();
   _VaccineUpdateScreenState createState() => _VaccineUpdateScreenState();
}

class _VaccineUpdateScreenState extends State<VaccineUpdateScreen> {
  TextEditingController _currentVaccineNameController = TextEditingController();
  TextEditingController _vaccineNameController = TextEditingController();
  TextEditingController _doseChangesController = TextEditingController();
  TextEditingController _doseDateFromController = TextEditingController();
  TextEditingController _doseDateAfterController = TextEditingController();
  TextEditingController _diseasesController = TextEditingController();

  /*void initState() {
    super.initState();

    // Set the current values in the text fields
    _currentVaccineNameController.text = "Current Vaccine Name";
  }*/

  Future<void> updateVaccineInformation() async {
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore.instance
        .collection('Vaccines')
        .where('name', isEqualTo: _currentVaccineNameController.text)
        .get();

    List<Map<String, dynamic>> searchResult = [];
    String ID = result.docs[0].id;
    result.docs.forEach((document) {
      Map<String, dynamic> data = document.data();
      searchResult.add(data);
    });
    print(searchResult[0]);
    print(ID);
    if (searchResult.length > 0){
      searchResult[0]['name'] = _vaccineNameController.text;
      searchResult[0]['dose'] = _doseChangesController.text;
      searchResult[0]['from'] = _doseDateFromController.text;
      searchResult[0]['to'] = _doseDateFromController.text;
      List<dynamic> diseases = _diseasesController.text.split(",");
      searchResult[0]['diseases'] = diseases;

      List<String> StrindIDnew = [];
      String res = '';
      for (int i = 0; i <  _vaccineNameController.text.length; i++) {
        res = res + _vaccineNameController.text[i];
        StrindIDnew.add(res);
      }
      searchResult[0]['StrindID'] = StrindIDnew;

      final docuser = FirebaseFirestore.instance
                          .collection('Vaccines')
                          .doc(ID);
      docuser.update(searchResult[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 97, 148),
        title: Text('Update Vaccine Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Flexible(
              child: Image.asset(
                'images/vaccine.png',
                height: 150,
              ),
            ),
            // Replace with your image path
            SizedBox(height: 16.0),
            Flexible(
              child: TextFormField(
                controller: _currentVaccineNameController,
                decoration: InputDecoration(
                  labelText: 'Vaccine Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                //enabled: false,
              ),
            ),
            Flexible(
              child: TextField(
                controller: _vaccineNameController,
                decoration: InputDecoration(
                  labelText: 'Updated Vaccine Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),

            Flexible(
              child: TextField(
                controller: _doseChangesController,
                decoration: InputDecoration(
                  labelText: 'New Dosage',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _doseDateFromController,
                decoration: InputDecoration(
                  labelText: 'Dose Duration Start',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _doseDateAfterController,
                decoration: InputDecoration(
                  labelText: 'Dose Duration End',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _diseasesController,
                decoration: InputDecoration(
                  labelText: 'Updated Diseases (separated by comma)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.0),
            MaterialButton(
              color: const Color.fromARGB(255, 250, 97, 148),
              onPressed: () {
                updateVaccineInformation();
                Navigator.pop(context);
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Vaccine Updated')),
                );
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
