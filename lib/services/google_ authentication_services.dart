import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/services/firebase_authentication_servise.dart';

class GoogleAuthenticationService {
  final FirebaseAuthenticationServise _firebaseAuthenticationServise =
      locator<FirebaseAuthenticationServise>();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> signIn() async {
    final GoogleSignInAccount? user = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? auth = await user?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: auth?.accessToken,
      idToken: auth?.idToken,
    );

    await _firebaseAuthenticationServise.signIn(credential);
  }

  Future<void> signOut() async {
    await _firebaseAuthenticationServise.signOut();
  }
}
