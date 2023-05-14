import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class VaccineUpdateScreen extends StatefulWidget {
  @override
  _VaccineUpdateScreenState createState() => _VaccineUpdateScreenState();
}

class _VaccineUpdateScreenState extends State<VaccineUpdateScreen> {
  TextEditingController _currentVaccineNameController = TextEditingController();
  TextEditingController _vaccineNameController = TextEditingController();
  TextEditingController _doseChangesController = TextEditingController();
  TextEditingController _doseDateFromController = TextEditingController();
  TextEditingController _doseDateAfterController = TextEditingController();

  /*void initState() {
    super.initState();

    // Set the current values in the text fields
    _currentVaccineNameController.text = "Current Vaccine Name";
  }*/

  Future<void> _updateVaccineInformation() async {
    String currentVaccineName = _currentVaccineNameController.text;
    String vaccineName = _vaccineNameController.text;
    String doseChanges = _doseChangesController.text;
    String doseDateFrom = _doseDateFromController.text;
    String doseDateAfter = _doseDateAfterController.text;

    // Make an HTTP POST request to your API endpoint
    final response = await http.post(
      Uri.parse(
          'https://example.com/update-vaccine'), // Replace with your API endpoint
      body: {
        'currentVaccineName': currentVaccineName,
        'vaccineName': vaccineName,
        'doseChanges': doseChanges,
        'doseDateFrom': doseDateFrom,
        'doseDateAfter': doseDateAfter,
      },
    );

    // Check the response status
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: 'Vaccine information updated successfully',
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to update vaccine information',
        toastLength: Toast.LENGTH_SHORT,
      );
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
                  labelText: 'Current Vaccine Name',
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
                  labelText: 'Vaccine Name Changes',
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
                  labelText: 'Dose Changes',
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
                  labelText: 'Dose From',
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
                  labelText: 'Dose After',
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
