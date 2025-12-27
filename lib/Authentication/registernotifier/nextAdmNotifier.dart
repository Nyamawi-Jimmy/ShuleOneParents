import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shuleoneparents/Authentication/Repositories/NextAdmRepositories.dart';
import 'package:shuleoneparents/Authentication/registernotifier/NexrAdmn_state.dart';

final nextAdmProvider = FutureProvider<NextAdmModel>((ref) async {
  final repo = ref.read(nextadmRepositoryProvider);
  final list = await repo.fetchnextadm();
  return list.first; // API returns a list
});
