abstract class IStorageKeyValue {
  Future<void> saveEntry(String key, String value);
  Future<String?> getEntry(String key);
  Future<bool> deleteEntry(String key);
  Future<void> clear();
}
