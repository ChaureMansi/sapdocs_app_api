import 'package:http/http.dart' as http;
import 'dart:convert';

class Repository {
  Future<Map<String, dynamic>> login(String email, String password) async {
    var requestBody = {
      "userName": email,
      "password": password,
    };

    var url = Uri.parse('https://sapdos-api-v2.azurewebsites.net/api/Credentials/Login');

    try {
      var response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: {
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        String role = responseData['role'];
        return {'statusCode': response.statusCode, 'role': role};
      } else {
        return {'statusCode': response.statusCode};
      }
    } catch (error) {
      print('Error logging in: $error');
      return {'statusCode': 500}; 
    }
  }
}
