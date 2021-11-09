// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Settings {
  /// Зашифрованное хранилище локальных данных.
  late FlutterSecureStorage _storage;
  late Map<String, String> _secureValues;

  static const appName = 'Treearth';

  static const accessTokenKey = 'accessToken';

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
}
