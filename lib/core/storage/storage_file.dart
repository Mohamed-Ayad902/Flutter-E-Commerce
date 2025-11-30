import 'package:flutter_ecommerce/core/storage/storage.dart';

abstract class IStorageKeyValueFile {
  IStorageKeyValue get storageKV;
  Future<void> clearStorageFile();
  Future<bool> deleteStorageFile();
}
