import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:http/http.dart' as http;

class ApiUserRepository {
  final String backendBaseUrl;
  ApiUserRepository({required this.backendBaseUrl});

  Future<Map<String, dynamic>> signInWithFirebase() async {
    final user = fb.FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('No Firebase user signed in');
    final idToken = await user.getIdToken();
    final res = await http.post(
      Uri.parse('$backendBaseUrl/v1/auth/firebase_login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id_token': idToken}),
    );
    if (res.statusCode == 200) {
      return json.decode(res.body) as Map<String, dynamic>;
    }
    throw Exception('Backend firebase_login failed: ${res.statusCode} ${res.body}');
  }
}