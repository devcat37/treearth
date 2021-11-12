// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Settings {
  /// Зашифрованное хранилище локальных данных.
  late FlutterSecureStorage _storage;
  late Map<String, String> _secureValues;

  static const backendUrl = 'http://192.168.1.8:443/rest-api';
  static const JWT_ACCESS_SECRET = '4b&uH`>PD^+@"3fP';
  static const JWT_REFRESH_SECRET = 'Nc9"Zp&\$[ayPs=3p';

  static const appName = 'Treearth';

  static const latitudeKey = 'latitude';
  static const longtitudeKey = 'longtitude';
  static const radiusKey = 'radius';

  static const accessTokenKey = 'accessToken';
  static const refreshTokenKey = 'refreshToken';
  static const userIdKey = 'uid';

  static const defaultSearchSpotRadius = 0.05;

  Future initStorage() async {
    _storage = const FlutterSecureStorage();
    _secureValues = await _storage.readAll();
  }

  Future initFirebase() async {
    await Firebase.initializeApp();
  }

  String get accessToken => _secureValues[accessTokenKey] ?? '';
  set accessToken(String token) {
    _secureValues[accessTokenKey] = token;
    _storage.write(key: accessTokenKey, value: token);
  }

  String get refreshToken => _secureValues[refreshTokenKey] ?? '';
  set refreshToken(String token) {
    _secureValues[refreshTokenKey] = token;
    _storage.write(key: refreshTokenKey, value: token);
  }

  String get userId => _secureValues[userIdKey] ?? '';
  set userId(String uid) {
    _secureValues[userIdKey] = uid;
    _storage.write(key: userIdKey, value: uid);
  }
}
