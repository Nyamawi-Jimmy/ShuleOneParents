import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Repositories/classRegRepositories.dart';
import 'class_state.dart';

final classesProvider = FutureProvider<List<SchoolClass>>((ref) async {
  final repo = ref.read(classesRepositoryProvider);
  return repo.fetchClasses();
});
