import 'package:flutter/material.dart';
import 'package:sapdocs_app_api/DoctorListScreen/screens/doctorlist.dart';
import 'package:sapdocs_app_api/pallete.dart';

class SlotBookingScreen extends StatefulWidget {
  @override
  _SlotBookingScreenState createState() => _SlotBookingScreenState();
}

class _SlotBookingScreenState extends State<SlotBookingScreen> {
  int? _selectedSlotRow1; // To store selected slot index for row 1
  int? _selectedSlotRow2; // To store selected slot index for row 2

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
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  child: Image.asset("assets/images/PatientImg.png"),
                  width: 300,
                  height: 350,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor Name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Specialization',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Education',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star_border, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text(
                          '4.0',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Experience: 10 years',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Description: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
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
                      Icon(Icons.alarm, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Available Slots',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 1200), // Adjusted width for spacing
                      Icon(Icons.calendar_today, color: Colors.white),
                    ],
                  ),
                ),
              ),
              children: [
                // First Row of Radio Buttons
                _buildTimeSlotRow(1),
                // Second Row of Radio Buttons
                _buildTimeSlotRow(2),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _bookAppointment();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Pallete.main, // Text color
                ),
                child: Text('Book Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlotRow(int rowNumber) {
    List<String> timeSlots = [
      '9:00 AM - 10:00 AM', '10:00 AM - 11:00 AM', '11:00 AM - 12:00 AM', '12:00 PM - 1:00 PM', '1:00 PM - 2:00 PM', '2:00 PM - 3:00 PM', '3:00 PM - 4:00 PM', '4:00 PM - 5:00 PM'
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: timeSlots.map((slot) {
          int index = timeSlots.indexOf(slot);
          return Row(
            children: [
              Radio<int>(
                value: index,
                groupValue: rowNumber == 1 ? _selectedSlotRow1 : _selectedSlotRow2,
                onChanged: (value) {
                  setState(() {
                    if (rowNumber == 1) {
                      _selectedSlotRow1 = value;
                    } else {
                      _selectedSlotRow2 = value;
                    }
                  });
                },
              ),
              Text(slot),
            ],
          );
        }).toList(),
      ),
    );
  }

  void _bookAppointment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Appointment Booked'),
          content: Text('Appointment booked successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorList()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}