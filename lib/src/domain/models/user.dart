class User {
  final String id;
  final String name;
  final String role;
  final String avatarUrl;
  final int signsLearned;
  final String studyTime; // keep simple '10h 30m'
  final int streakDays;
  final int modulesCompleted;

  User({
    required this.id,
    required this.name,
    required this.role,
    required this.avatarUrl,
    required this.signsLearned,
    required this.studyTime,
    required this.streakDays,
    required this.modulesCompleted,
  });
}
