import 'package:flutter/material.dart';

class StepperFormDetails extends StatefulWidget {
  StepperFormDetails({
    Key? key,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.gender,
    required this.address,
    required this.professionalQualifications,
    required this.academicQualifications,
    required this.lastInstituteName,
  }) : super(key: key);
  String name;
  String email;
  String mobileNumber;
  String gender;
  String address;
  String academicQualifications;
  String lastInstituteName;
  String professionalQualifications;

  @override
  State<StepperFormDetails> createState() => _StepperFormDetailsState();
}

class _StepperFormDetailsState extends State<StepperFormDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Form Details"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Name: ${widget.name}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                      color: Colors.teal.shade900),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Email: ${widget.email}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                      color: Colors.teal.shade900),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Mobile Number: ${widget.mobileNumber}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                      color: Colors.teal.shade900),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Gender: ${widget.gender}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                      color: Colors.teal.shade900),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Address: ${widget.address}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                      color: Colors.teal.shade900),
                ),
              ),
            ),


            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Academic Qualifications: ${widget.academicQualifications}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                      color: Colors.teal.shade900),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Last Institute Name: ${widget.lastInstituteName}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                      color: Colors.teal.shade900),
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Professional Qualifications: ${widget.professionalQualifications}',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                      color: Colors.teal.shade900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
