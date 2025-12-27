import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../registernotifier/register_state.dart';
final registerRepositoryProvider =
Provider<RegisterRepository>((ref) => RegisterRepository());

class RegisterRepository {
  Future<void> register(RegisterState state) async {
    final response = await http.post(
      Uri.parse('https://portal.shuleone.co.ke/api/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "first_name": state.firstName,
        "middle_name": state.middleName,
        "last_name": state.LastName,
        "username": state.UserName,
        "adm_no": state.admNo,
        "class": state.selectedClass,
        "phone": state.phoneNumber,
        "email": state.email,
        "password": state.password,
      }),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception(jsonDecode(response.body)['message'] ?? 'Registration failed');
    }
  }
}
