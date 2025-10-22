import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/progress.dart';
import '../../data/repositories/progress_repository.dart';

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  return InMemoryProgressRepository();
});

final progressProvider = StateNotifierProvider<ProgressNotifier, Progress>((ref) {
  final repo = ref.watch(progressRepositoryProvider);
  return ProgressNotifier(repo);
});

class ProgressNotifier extends StateNotifier<Progress> {
  final ProgressRepository _repo;
  ProgressNotifier(this._repo) : super(Progress());

  Future<void> load() async {
    state = await _repo.loadProgress();
  }

  Future<void> addXp(int xp) async {
    final updated = Progress(xp: state.xp + xp, level: state.level, coins: state.coins);
    state = updated;
    await _repo.saveProgress(state);
  }
}
