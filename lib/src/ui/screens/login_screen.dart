import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ...existing imports

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _loading = false;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      body: Stack(
        children: [
          Positioned(top: -80, left: -80, child: Container(width: 200, height: 200, decoration: BoxDecoration(color: Colors.lightBlue.shade100.withOpacity(0.45), shape: BoxShape.circle,))),
          Positioned(bottom: -90, right: -90, child: Container(width: 240, height: 240, decoration: BoxDecoration(color: Colors.blue.shade100.withOpacity(0.45), shape: BoxShape.circle,))),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFFFFFFF), Color(0xFFF7FBFF)]),
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                    boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.06), blurRadius: 30, offset: const Offset(0, 12))],
                  ),
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Signoise', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800, fontSize: 28)),
                      const SizedBox(height: 6),
                      Text('Seu portal para a língua de sinais.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700])),
                      const SizedBox(height: 18),
                      // email
                      Container(
                        height: 54,
                        decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFE5E7EB)), boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 2)]),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(children: [const Icon(Icons.mail, color: Color(0xFF6B7280)), const SizedBox(width: 8), Expanded(child: TextField(controller: _emailController, decoration: const InputDecoration(border: InputBorder.none, hintText: 'Seu e-mail')))]),
                      ),
                      const SizedBox(height: 12),
                      // password
                      Container(
                        height: 54,
                        decoration: BoxDecoration(color: const Color(0xFFF9FAFB), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFE5E7EB))),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(children: [const Icon(Icons.lock, color: Color(0xFF6B7280)), const SizedBox(width: 8), Expanded(child: TextField(controller: _passController, obscureText: true, decoration: const InputDecoration(border: InputBorder.none, hintText: 'Sua senha')))]),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: DecoratedBox(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), gradient: const LinearGradient(colors: [Color(0xFF4F94CD), Color(0xFF1E90FF)]), boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 18, offset: const Offset(0, 8))]),
                          child: ElevatedButton(
                            onPressed: _loading ? null : () async {
                              setState(() => _loading = true);
                              // ignore inputs and navigate to home (mock login)
                              await Future.delayed(const Duration(milliseconds: 400));
                              if (!mounted) return;
                              context.go('/home');
                              setState(() => _loading = false);
                            },
                            style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                            child: _loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Entrar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text('Esqueceu a senha?'))),
                      Row(children: const [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('ou', style: TextStyle(color: Color(0xFF6B7280)))), Expanded(child: Divider())]),
                      const SizedBox(height: 12),
                      const SizedBox(height: 6),
                      const SizedBox(height: 6),
                      // Prominent register call-to-action
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => context.push('/register'),
                          style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14), backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), side: const BorderSide(color: Color(0xFFE5E7EB))),
                          child: const Text('Criar Conta', style: TextStyle(color: Color(0xFF1E90FF), fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}