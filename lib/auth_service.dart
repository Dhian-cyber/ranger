import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthResponse {
  final bool success;
  final Map<String, dynamic> data;

  AuthResponse({required this.success, required this.data});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'],
      data: json['data'] ?? {},
    );
  }

  String get username => data['username'] ?? '';
  String get name => data['name'] ?? '';
}

class AuthService {
  final String _loginUrl = 'http://flutter.masaku.my.id';

  Future<AuthResponse> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(_loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return AuthResponse.fromJson(jsonResponse);
    } else {
      return AuthResponse(success: false, data: {});
    }
  }
}
