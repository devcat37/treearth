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
  static const REFRESH_ENDPOINT = AUTH_ENDPOINT + '/refresh';

  ApiClient get apiClient => service<ApiClient>();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  /// Возвращает пользователя с firebase для дальнейшей авторизации.
  Future<UserCredential?> signInWithGoogle() async {
    // Получение google пользователя с его access токеном.
    GoogleSignInAccount? googleAccount;
    googleAccount = await _googleSignIn.signIn();

    // Авторизация в Firebase.
    final GoogleSignInAuthentication? googleAuth = await googleAccount?.authentication;
    final OAuthCredential credential =
        GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user);
    // Возвращается ID пользователя.
    return userCredential;
  }

  Future<UserCredential?> signInWithPhoneNumber() async {}

  Future<LoadResult<AuthResultData?>> login(String userId) async {
    try {
      // Тело запроса.
      final Map<String, dynamic> data = {
        Settings.userIdKey: userId,
      };

      final Map<String, dynamic> result =
          await apiClient.post(url: LOGIN_ENDPOINT, data: data).then((value) => value.data);

      return LoadResult(data: AuthResultData.fromJson(result['data']));
    } catch (e, s) {
      print(e);
      print(s);
      return LoadResult(exception: e);
    }
  }

  Future<LoadResult<AuthResultData?>> register(String userId) async {
    try {
      // Тело запроса.
      final Map<String, dynamic> data = {
        Settings.userIdKey: userId,
      };

      final Map<String, dynamic> result =
          await apiClient.post(url: REGISTER_ENDPOINT, data: data).then((value) => value.data);

      return LoadResult(data: AuthResultData.fromJson(result['data']));
    } catch (e) {
      return LoadResult(exception: e);
    }
  }

  Future<LoadResult<AuthResultData?>> refreshToken() async {
    try {
      // Тело запроса.
      final Map<String, dynamic> data = {
        Settings.refreshTokenKey: service<Settings>().refreshToken,
      };

      final Map<String, dynamic> result =
          await apiClient.post(url: REFRESH_ENDPOINT, data: data).then((value) => value.data);

      return LoadResult(data: AuthResultData.fromJson(result['data']));
    } catch (e) {
      return LoadResult(exception: e);
    }
  }

  Future<void> logout() async {
    _googleSignIn.signOut();
  }
}
