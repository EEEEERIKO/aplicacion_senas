import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../data/repositories/api_user_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _loading = false;

  Future<void> _signInWithEmail() async {
    setState(() => _loading = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passController.text);
      // on success, backend sync will be called elsewhere
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'Auth error')));
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() => _loading = true);
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // cancelled
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      // optionally call backend to sync
      final repo = ApiUserRepository(backendBaseUrl: 'http://10.0.2.2:8000');
      final userMap = await repo.signInWithFirebase();
      // navigate to home or update app state
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            width: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.6)]),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
              boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, 8))],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Signoise', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('Seu portal para a língua de sinais.', style: theme.textTheme.bodyMedium),
                const SizedBox(height: 18),
                TextField(controller: _emailController, decoration: const InputDecoration(prefixIcon: Icon(Icons.mail), hintText: 'Seu e-mail')),
                const SizedBox(height: 12),
                TextField(controller: _passController, obscureText: true, decoration: const InputDecoration(prefixIcon: Icon(Icons.lock), hintText: 'Sua senha')),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _signInWithEmail,
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF29B6F6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: _loading ? const CircularProgressIndicator() : const Text('Entrar'),
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Esqueceu a senha?')),
                Row(children: const [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('ou')), Expanded(child: Divider())]),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(onPressed: _signInWithGoogle, icon: Image.network('https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg', width: 28)),
                  const SizedBox(width: 12),
                  IconButton(onPressed: () {}, icon: Image.network('https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg', width: 24)),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}