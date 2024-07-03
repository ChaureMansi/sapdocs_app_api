import 'package:flutter/material.dart';
import 'package:sapdocs_app_api/DoctorAppointmentScreen/data/models/appointment_model.dart';

class AppointmentList extends StatelessWidget {
  final List<Appointment> appointments;

  AppointmentList({required this.appointments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 45,
                  height: 40,
                  decoration: BoxDecoration(
                    color: index % 3 == 0
                        ? Colors.red
                        : index % 3 == 1
                            ? Colors.green
                            : Colors.blue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.watch_later_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 35),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color.fromARGB(255, 160, 205, 242),
                  ),
                  child: Center(
                    child: Text(
                      '${appointment.time}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 35),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: index % 3 == 0
                            ? Colors.red
                            : index % 3 == 1
                                ? Colors.green
                                : Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${appointment.patientName}',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 150),
                          Text(
                            '${appointment.age} years',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
