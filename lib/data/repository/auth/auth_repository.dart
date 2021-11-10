// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:treearth/data/api/api_client.dart';
import 'package:treearth/data/models/auth_result_data.dart';
import 'package:treearth/domain/repository/load_result.dart';
import 'package:treearth/internal/services/service_locator.dart';
import 'package:treearth/internal/services/settings.dart';

class AuthRepository {
  static const AUTH_ENDPOINT = Settings.backendUrl + '/auth';
  static const LOGIN_ENDPOINT = AUTH_ENDPOINT + '/login';
  static const REGISTER_ENDPOINT = AUTH_ENDPOINT + '/registration';

  ApiClient get apiClient => service<ApiClient>();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  /// Возвращает пользователя с firebase для дальнейшей авторизации.
  Future<User?> signInWithGoogle() async {
    // Получение google пользователя с его access токеном.
    GoogleSignInAccount? googleAccount;
    googleAccount = await _googleSignIn.signIn();

    // Авторизация в Firebase.
    final GoogleSignInAuthentication? googleAuth = await googleAccount?.authentication;
    final OAuthCredential credential =
        GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // Возвращается ID пользователя.
    return userCredential.user;
  }

  Future<User?> signInWithPhoneNumber() async {}

  Future<LoadResult<AuthResultData?>> login(String userId) async {
    try {
      final Map<String, dynamic> data = {
        'uid': userId,
      };

      final Map<String, dynamic> result =
          await apiClient.post(url: LOGIN_ENDPOINT, data: data).then((value) => value.data);

      return LoadResult(data: AuthResultData.fromJson(result['data']));
    } catch (e) {
      print(e);
      return LoadResult(exception: e);
    }
  }

  Future<LoadResult<AuthResultData?>> register(String userId) async {
    try {
      final Map<String, dynamic> data = {
        'uid': userId,
      };

      final Map<String, dynamic> result =
          await apiClient.post(url: REGISTER_ENDPOINT, data: data).then((value) => value.data);

      return LoadResult(data: AuthResultData.fromJson(result['data']));
    } catch (e) {
      return LoadResult(exception: e);
    }
  }
}
