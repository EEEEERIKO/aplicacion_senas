import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Temporarily run without Firebase configured (mock auth)
  runApp(const ProviderScope(child: App()));
}

