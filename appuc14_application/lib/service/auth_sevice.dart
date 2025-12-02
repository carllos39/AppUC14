import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ------------------------ LOGIN ------------------------
  Future<User?> login(String email, String senha) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Erro ao fazer login";
    }
  }

  // ------------------------ CADASTRO ------------------------
  Future<User?> registrar(String email, String senha) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Erro ao realizar cadastro";
    }
  }

  // ------------------------ LOGOUT ------------------------
  Future<void> logout() async {
    await _auth.signOut();
  }

  // ------------------------ USUÁRIO LOGADO ------------------------
  User? get usuarioAtual => _auth.currentUser;
}
