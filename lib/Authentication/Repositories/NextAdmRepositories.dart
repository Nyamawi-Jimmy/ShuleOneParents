import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shuleoneparents/Authentication/registernotifier/NexrAdmn_state.dart';

import '../registernotifier/class_state.dart';

final nextadmRepositoryProvider =
Provider<Nextadmrepositories>((ref) => Nextadmrepositories());


class Nextadmrepositories {
  Future<List<NextAdmModel>> fetchnextadm() async {
    final response = await http.get(
      Uri.parse('https://portal.shuleone.co.ke/api/getClasses'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load classes');
    }

    final List data = jsonDecode(response.body);
    return data
        .map((e) => NextAdmModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}