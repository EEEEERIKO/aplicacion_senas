import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ranking')),
      body: const Center(child: Text('Próxima pestaña Ranking', style: TextStyle(fontSize: 18))),
    );
  }
}
