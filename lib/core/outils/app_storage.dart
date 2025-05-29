
import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _box = GetStorage();

  // Clés de stockage
  static const String _tokenKey = 'token';
  static const String _userKey = 'user';

  // Enregistrer le token
  Future<void> saveToken(String token) async {
    await _box.write(_tokenKey, token);
  }

  // Lire le token
  String? getToken() {
    return _box.read(_tokenKey);
  }

  // Supprimer le token
  Future<void> clearToken() async {
    await _box.remove(_tokenKey);
  }

  // Enregistrer l'utilisateur (optionnel)
  Future<void> saveUser(Map<String, dynamic> userData) async {
    await _box.write(_userKey, userData);
  }

  Map<String, dynamic>? getUser() {
    return _box.read(_userKey);
  }

  Future<void> clearUser() async {
    await _box.remove(_userKey);
  }

  // Vider tout le stockage
  Future<void> clearAll() async {
    await _box.erase();
  }
}
