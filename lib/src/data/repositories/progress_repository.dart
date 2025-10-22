import '../../domain/models/progress.dart';

abstract class ProgressRepository {
  Future<Progress> loadProgress();
  Future<void> saveProgress(Progress p);
}

class InMemoryProgressRepository implements ProgressRepository {
  Progress _p = Progress();

  @override
  Future<Progress> loadProgress() async => _p;

  @override
  Future<void> saveProgress(Progress p) async {
    _p = p;
  }
}
