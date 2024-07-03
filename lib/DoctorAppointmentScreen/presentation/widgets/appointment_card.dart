import 'package:flutter/material.dart';
import 'package:sapdocs_app_api/pallete.dart';

class AppointmentCard extends StatelessWidget {
  final String title;
  final String value;

  AppointmentCard({required this.title, required this.value, required TextStyle style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 170,
      decoration: BoxDecoration(
        color: Pallete.sub,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
