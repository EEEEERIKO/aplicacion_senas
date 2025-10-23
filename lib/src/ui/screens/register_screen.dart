import 'package:flutter/material.dart';
import '../../data/repositories/mock_user_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;

  Future<void> _createAccount() async {
    setState(() => _loading = true);
    try {
      final repo = MockUserRepository();
      await repo.register(_name.text.trim(), _email.text.trim(), _password.text);
      // Always continue to home (mock)
      await Future.delayed(const Duration(milliseconds: 300));
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      // show centered snack inside the screen so it doesn't overflow
      final snack = SnackBar(content: Text(e.toString()), behavior: SnackBarBehavior.floating, margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 24));
      ScaffoldMessenger.of(context).showSnackBar(snack);
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      appBar: AppBar(title: const Text('Criar Conta'), backgroundColor: Colors.transparent, elevation: 0, foregroundColor: Colors.black),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white, boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, 10))]),
              child: Column(
                children: [
                  Text('Criar Conta', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 8),
                  Text('Comece sua jornada no aprendizado de Libras.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
                  const SizedBox(height: 18),
                  // name
                  Container(height: 54, decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFE5E7EB))), padding: const EdgeInsets.symmetric(horizontal: 12), child: Row(children: [const Icon(Icons.person, color: Color(0xFF6B7280)), const SizedBox(width: 8), Expanded(child: TextField(controller: _name, decoration: const InputDecoration(border: InputBorder.none, hintText: 'Nome completo')))])),
                  const SizedBox(height: 12),
                  // email
                  Container(height: 54, decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFE5E7EB))), padding: const EdgeInsets.symmetric(horizontal: 12), child: Row(children: [const Icon(Icons.mail, color: Color(0xFF6B7280)), const SizedBox(width: 8), Expanded(child: TextField(controller: _email, decoration: const InputDecoration(border: InputBorder.none, hintText: 'E-mail')))])),
                  const SizedBox(height: 12),
                  // password
                  Container(height: 54, decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFE5E7EB))), padding: const EdgeInsets.symmetric(horizontal: 12), child: Row(children: [const Icon(Icons.lock, color: Color(0xFF6B7280)), const SizedBox(width: 8), Expanded(child: TextField(controller: _password, obscureText: true, decoration: const InputDecoration(border: InputBorder.none, hintText: 'Senha'))), const SizedBox(width: 8), const Icon(Icons.visibility_off, color: Color(0xFF6B7280))])),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(colors: [Color(0xFF4F94CD), Color(0xFF1E90FF)]),
                        boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.18), blurRadius: 18, offset: const Offset(0, 8))],
                      ),
                      child: ElevatedButton(
                        onPressed: _loading ? null : _createAccount,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: _loading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Criar Conta', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
