import 'package:flutter_ecommerce/core/storage/storage.dart';
import 'package:flutter_ecommerce/core/storage/storage_file.dart';

/// lightweight wrapper: here we just delegate to storageKV
class DataStoreFile implements IStorageKeyValueFile {
  final IStorageKeyValue _kv;
  DataStoreFile(this._kv);

  @override
  IStorageKeyValue get storageKV => _kv;

  @override
  Future<void> clearStorageFile() => _kv.clear();

  @override
  Future<bool> deleteStorageFile() async {
    try {
      // There's no "file" to delete for FlutterSecureStorage; just clear
      await _kv.clear();
      return true;
    } catch (_) {
      return false;
    }
  }
}