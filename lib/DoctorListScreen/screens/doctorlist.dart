import 'package:flutter/material.dart';
import 'package:sapdocs_app_api/DoctorListScreen/widgets/DoctorListScreen.dart';
import 'package:sapdocs_app_api/pallete.dart';

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Pallete.main,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 25),
                      Text(
                        "SAPDOCS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 55,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 70),
                      Expanded(
                        child: Center(
                          child: ListView(
                            children: [
                              ListTile(
                                leading: Icon(Icons.category, color: Colors.white),
                                title: Text('Categories', style: TextStyle(color: Colors.white, fontSize: 23)),
                              ),
                              ListTile(
                                leading: Icon(Icons.calendar_today, color: Colors.white),
                                title: Text('Appointment', style: TextStyle(color: Colors.white, fontSize: 25)),
                              ),
                              ListTile(
                                leading: Icon(Icons.chat, color: Colors.white),
                                title: Text('Chat', style: TextStyle(color: Colors.white, fontSize: 25)),
                              ),
                              ListTile(
                                leading: Icon(Icons.settings, color: Colors.white),
                                title: Text('Settings', style: TextStyle(color: Colors.white, fontSize: 25)),
                              ),
                              ListTile(
                                leading: Icon(Icons.logout, color: Colors.white),
                                title: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 25)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hello! \nSatish',
                              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                            ),
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage('assets/images/doct.png'), 
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50, 
                                decoration: BoxDecoration(
                                  color: Pallete.main,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Doctor's List",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        
                       
                        Expanded(
                        child: DoctorListScreen(),
                        ),

                      
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}
