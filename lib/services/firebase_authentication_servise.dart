import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationServise {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authState => _firebaseAuth.authStateChanges();

  Future<void> signIn(credential) async {
    try {
      if (credential is AuthCredential) {
        _firebaseAuth.signInWithCredential(credential);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
