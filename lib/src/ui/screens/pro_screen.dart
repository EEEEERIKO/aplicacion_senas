import 'package:flutter/material.dart';

class ProScreen extends StatelessWidget {
  const ProScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pro')),
      body: const Center(child: Text('Próxima pestaña Pro', style: TextStyle(fontSize: 18))),
    );
  }
}
