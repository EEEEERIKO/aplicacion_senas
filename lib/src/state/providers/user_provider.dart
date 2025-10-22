import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/user_repository.dart';
import '../../domain/models/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return MockUserRepository();
});

final currentUserProvider = FutureProvider<User>((ref) async {
  final repo = ref.watch(userRepositoryProvider);
  return repo.fetchCurrentUser();
});
