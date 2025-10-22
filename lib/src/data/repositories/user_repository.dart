import '../../domain/models/user.dart';

abstract class UserRepository {
  Future<User> fetchCurrentUser();
}

/// Simple in-memory mock repository for development.
class MockUserRepository implements UserRepository {
  @override
  Future<User> fetchCurrentUser() async {
    // simulate network latency
    await Future.delayed(const Duration(milliseconds: 200));
    return User(
      id: 'user-1',
      name: 'Alex Green',
      role: 'Aprendiz de Sinais',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuChcc8FfZ60LeCeAb64M4bUB8jcAP87T55SyP-HK...',
      signsLearned: 150,
      studyTime: '10h 30m',
      streakDays: 20,
      modulesCompleted: 8,
    );
  }
}
