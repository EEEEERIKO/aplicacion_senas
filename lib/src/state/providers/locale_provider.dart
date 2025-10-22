import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final localeProvider = StateProvider<Locale>((ref) {
  return const Locale('pt', 'BR');
});

final localizedStringsProvider = Provider<Map<String, Map<String, String>>>((ref) {
  return {
    'pt_BR': {
      'profile': 'Perfil',
      'my_progress': 'Meu Progresso',
      'signs_learned': 'Sinais Aprendidos',
      'study_time': 'Tempo de Estudo',
      'streak_days': 'Dias Consecutivos',
      'modules_completed': 'Módulos Concluídos',
      'achievements': 'Minhas Conquistas',
      'settings': 'Ajustes',
      'logout': 'Sair',
      'home': 'Início',
      'lessons': 'Aulas',
      'practice': 'Praticar',
    },
    'en_US': {
      'profile': 'Profile',
      'my_progress': 'My Progress',
      'signs_learned': 'Signs Learned',
      'study_time': 'Study Time',
      'streak_days': 'Streak Days',
      'modules_completed': 'Modules Completed',
      'achievements': 'My Achievements',
      'settings': 'Settings',
      'logout': 'Logout',
      'home': 'Home',
      'lessons': 'Lessons',
      'practice': 'Practice',
    }
  };
});
