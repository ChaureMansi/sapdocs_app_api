import 'package:flutter/material.dart';
import 'package:sapdocs_app_api/pallete.dart';

class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      child: Image.asset("assets/images/PatientImg.png"),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 8),
                            Text(
                              'Patient Name',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                         Row(
                          children: [
                            Icon(Icons.circle_outlined, size: 15, color: Colors.black,),
                            SizedBox(width: 8),
                            Text(
                              'Patient Age',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Issue Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ExpansionTile(
                  title: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Pallete.main,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.history, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Patient History',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Pallete.main,
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.note),
                          title: Text(
                            'Blood Report',
                            style: TextStyle(fontSize: 14),
                          ),
                          onTap: () {
                            // Handle blood report tap
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Pallete.main,
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.scanner),
                          title: Text('CT Scan Report'),
                          onTap: () {
                            // Handle CT scan report tap
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(height: 16),
                ExpansionTile(
                  title: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Pallete.main,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.file_copy, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Prescription',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Pallete.main,
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.note),
                          title: Text(
                            '26 MARCH 2022',
                            style: TextStyle(fontSize: 14),
                          ),
                          onTap: () {
                            // Handle blood report tap
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Pallete.main,
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.scanner),
                          title: Text('13 APRIL 2022'),
                          onTap: () {
                            // Handle CT scan report tap
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Pallete.main,
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.scanner),
                          title: Text('Add', style: TextStyle(color: Colors.grey),),
                          onTap: () {
                            // Handle CT scan report tap
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            
            ),
          ),
        ),
      ),
    );
  }
}
