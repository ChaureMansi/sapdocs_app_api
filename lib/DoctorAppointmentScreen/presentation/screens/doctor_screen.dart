import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdocs_app_api/DoctorAppointmentScreen/domain/repositories/appointment_repository.dart';
import 'package:sapdocs_app_api/DoctorAppointmentScreen/presentation/blocs/appointment_bloc.dart';
import 'package:sapdocs_app_api/DoctorAppointmentScreen/presentation/widgets/appointment_card.dart';
import 'package:sapdocs_app_api/DoctorAppointmentScreen/presentation/widgets/appointment_list.dart';
import 'package:sapdocs_app_api/LoginScreen/presentation/view/login_screen.dart';
import 'package:sapdocs_app_api/Patient/PatientDetailScreen.dart';
import 'package:sapdocs_app_api/pallete.dart';

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentBloc(AppointmentRepository())..add(LoadAppointments()),
      child: Scaffold(
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
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginScreen()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
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
                                'Hello! \nDr. Amol',
                                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage('assets/images/doct.png'),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Today's Appointment",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppointmentCard(
                                title: 'Pending \nAppointments',
                                style: TextStyle(color: Colors.white),
                                value: '19/40',
                              ),
                              SizedBox(width: 20),
                              AppointmentCard(
                                title: 'Completed \nAppointments',
                                style: TextStyle(color: Colors.white),
                                value: '21/40',
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 60,
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
                                          'Wednesday, March 7',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Icon(
                                            Icons.calendar_today,
                                            color: Pallete.main,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: BlocBuilder<AppointmentBloc, AppointmentState>(
                              builder: (context, state) {
                                if (state is AppointmentLoading) {
                                  return Center(child: CircularProgressIndicator());
                                } else if (state is AppointmentLoaded) {
                                  return AppointmentList(appointments: state.appointments);
                                } else if (state is AppointmentError) {
                                  return Text('Failed to load appointments: ${state.error}');
                                } else {
                                  return Text('Failed to load appointments');
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 35,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PatientScreen()));
                              },
                              child: const Text(
                                'Patient details',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                fixedSize: const Size(300, 40),
                                backgroundColor: Pallete.main,
                              ),
                            ),
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
      ),
    );
  }
}
