import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signoise'),
        actions: [IconButton(onPressed: () => context.push('/profile'), icon: const Icon(Icons.person))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('Olá, aprendiz!', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('Continue suas lições e veja seu progresso', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 18),

            // Progress card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Progresso da semana', style: TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(value: 0.42, color: Colors.blue, backgroundColor: Colors.blue.shade100),
                          const SizedBox(height: 8),
                          const Text('42% completado', style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    CircleAvatar(radius: 30, backgroundColor: Colors.blue.shade50, child: const Icon(Icons.school, color: Colors.blue, size: 30)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),
            const Text('Lições recomendadas', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(height: 12),

            // lessons list (mock)
            Column(
              children: List.generate(5, (i) {
                final title = 'Lição ${i + 1} - Saudações';
                final subtitle = i % 2 == 0 ? 'Nível: Iniciante' : 'Nível: Intermediário';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(backgroundColor: Colors.indigo.shade50, child: const Icon(Icons.play_arrow, color: Colors.indigo)),
                    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                    subtitle: Text(subtitle),
                    trailing: ElevatedButton(onPressed: () => context.push('/profile'), child: const Text('Iniciar')),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
