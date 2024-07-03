import 'package:sapdocs_app_api/DoctorAppointmentScreen/data/models/appointment_model.dart';

class AppointmentRepository {
  Future<List<Appointment>> getAppointments() async {
    
    await Future.delayed(Duration(seconds: 2));
    
    return [
      Appointment(patientName: 'John Doe', time: '10:00 AM', age: '30'),
      Appointment(patientName: 'Jane Smith', time: '11:00 AM', age: '25'),
 
    ];
  }
}
