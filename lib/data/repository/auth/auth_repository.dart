// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  /// Возвращает uid пользователя с firebase для дальнейшей авторизации.
  Future<String?> signInWithGoogle() async {
    // Получение google пользователя с его access токеном.
    GoogleSignInAccount? googleAccount;
    googleAccount = await _googleSignIn.signIn();

    // Авторизация в Firebase.
    final GoogleSignInAuthentication? googleAuth = await googleAccount?.authentication;
    final OAuthCredential credential =
        GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // Возвращается ID пользователя.
    return userCredential.user?.uid;
  }
}
