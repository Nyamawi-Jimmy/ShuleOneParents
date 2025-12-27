import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../registernotifier/class_state.dart';

final classesRepositoryProvider =
Provider<Classregrepositories>((ref) => Classregrepositories());


class Classregrepositories {
  Future<List<SchoolClass>> fetchClasses() async {
    final response = await http.get(
      Uri.parse('https://portal.shuleone.co.ke/api/getClasses'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load classes');
    }

    final List data = jsonDecode(response.body);
    return data.map((e) => SchoolClass.fromJson(e)).toList();
  }
}