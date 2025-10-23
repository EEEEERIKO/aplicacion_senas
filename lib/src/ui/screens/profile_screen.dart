import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state/providers/user_provider.dart';
import '../../state/providers/locale_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(currentUserProvider);
    final locale = ref.watch(localeProvider);
    final strings = ref.watch(localizedStringsProvider)["${locale.languageCode}_${locale.countryCode}"]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(strings['profile'] ?? 'Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // toggle language simple: pt_BR <-> en_US
              final current = ref.read(localeProvider);
              if (current.languageCode == 'pt') {
                ref.read(localeProvider.notifier).state = const Locale('en', 'US');
              } else {
                ref.read(localeProvider.notifier).state = const Locale('pt', 'BR');
              }
            },
          )
        ],
      ),
  body: asyncUser.when(
        data: (user) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(user.role, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(strings['my_progress'] ?? 'My Progress', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _statCard(context, Icons.sign_language, user.signsLearned.toString(), strings['signs_learned']!),
                  _statCard(context, Icons.schedule, user.studyTime, strings['study_time']!),
                  _statCard(context, Icons.local_fire_department, user.streakDays.toString(), strings['streak_days']!),
                  _statCard(context, Icons.school, user.modulesCompleted.toString(), strings['modules_completed']!),
                ],
              ),
              const SizedBox(height: 20),
              Text(strings['achievements'] ?? 'Achievements', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (i) => _achievementCard(context, i)),
                ),
              ),
              const SizedBox(height: 20),
              Text(strings['settings'] ?? 'Settings', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Card(
                child: Column(
                  children: [
                    ListTile(leading: const Icon(Icons.person), title: Text(strings['profile'] ?? 'Profile'), trailing: const Icon(Icons.arrow_forward_ios)),
                    const Divider(height: 1),
                    ListTile(leading: const Icon(Icons.notifications), title: Text('Notificações'), trailing: const Icon(Icons.arrow_forward_ios)),
                    const Divider(height: 1),
                    ListTile(leading: const Icon(Icons.school), title: Text('Preferências de Aprendizado'), trailing: const Icon(Icons.arrow_forward_ios)),
                    const Divider(height: 1),
                    ListTile(leading: const Icon(Icons.info), title: Text('Sobre o App'), trailing: const Icon(Icons.arrow_forward_ios)),
                    const Divider(height: 1),
                    ListTile(leading: const Icon(Icons.logout, color: Colors.red), title: Text(strings['logout'] ?? 'Logout', style: const TextStyle(color: Colors.red)), onTap: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Erro: $e')),
      ),
      
    );
  }

  Widget _statCard(BuildContext context, IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        color: Theme.of(context).cardColor.withOpacity(0.6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 28),
          const SizedBox(height: 8),
          Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _achievementCard(BuildContext context, int index) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 28, backgroundColor: Theme.of(context).colorScheme.primary, child: const Icon(Icons.emoji_events, color: Colors.white, size: 32)),
          const SizedBox(height: 8),
          Text('Conquista ${index + 1}', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
