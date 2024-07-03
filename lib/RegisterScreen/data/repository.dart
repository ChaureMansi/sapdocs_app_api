import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterRepository {
  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String mobile,
    required String role,
    String specialization = '',
    String experience = '',
    String disease = '',
    String age = '',
  }) async {
    var data = {
      "name": email.trim(),
      "email": email.trim(),
      "mobileNumber": mobile.trim(),
      "address": "", // You can add address field if needed
      "password": password,
      "role": role,
      // Add other fields as needed
    };

    if (role == 'doctor') {
      data.addAll({
        "specialization": specialization.trim(),
        "experience": experience.trim(),
      });
    } else if (role == 'patient') {
      data.addAll({
        "disease": disease.trim(),
        "age": age.trim(),
      });
    }

    var url = Uri.parse('https://sapdos-api-v2.azurewebsites.net/api/Credentials/Register');
    var response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      print('Registration successful: ${response.body}');
    } else {
      print('Failed to register: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to register. Please try again.');
    }
  }
}
