import 'package:flutter_ecommerce/core/storage/storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageAdapter implements IStorageKeyValue {
  final FlutterSecureStorage _secureStorage;

  const FlutterSecureStorageAdapter({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  @override
  Future<void> saveEntry(String key, String value) => _secureStorage.write(key: key, value: value);

  @override
  Future<String?> getEntry(String key) => _secureStorage.read(key: key);

  @override
  Future<bool> deleteEntry(String key) async {
    try {
      await _secureStorage.delete(key: key);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> clear() => _secureStorage.deleteAll();
}