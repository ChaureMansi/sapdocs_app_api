import 'package:flutter/material.dart';
import 'package:sapdocs_app_api/DoctorListScreen/widgets/doctor.dart';
import 'package:sapdocs_app_api/Patient/SlotBookingScreen.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SlotBookingScreen(), 
          ),
        );
      },
      child: Card(
        color: Color.fromARGB(255, 195, 198, 206),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(doctor.imageUrl),
                radius: 50.0,
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text(doctor.specialization),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star_half),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
