import 'dart:convert';

import 'package:flutter_ecommerce/core/storage/storage.dart';

extension StorageModelX on IStorageKeyValue {
  /// Save any object that is encodable by jsonEncode (or has toJson()).
  Future<void> saveModel<T>(String key, T model) {
    final json = jsonEncode(model);
    return saveEntry(key, json);
  }

  /// Read and parse a JSON object, using a `fromJson` factory:
  Future<T?> readModel<T>(
      String key, T Function(Map<String, dynamic>) fromJson) async {
    final raw = await getEntry(key);
    if (raw == null || raw.isEmpty) return null;
    final Map<String, dynamic> decoded =
        jsonDecode(raw) as Map<String, dynamic>;
    return fromJson(decoded);
  }

  /// Read and parse a list of models.
  Future<List<T>> readListModel<T>(
      String key, T Function(Map<String, dynamic>) fromJson) async {
    final raw = await getEntry(key);
    if (raw == null || raw.isEmpty) return [];
    final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
    return decoded.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Save a list of models
  Future<void> saveListModel<T>(String key, List<T> list) {
    final json = jsonEncode(list);
    return saveEntry(key, json);
  }

  /// Save a primitive boolean as string (consistent with earlier approach)
  Future<void> saveBool(String key, bool value) =>
      saveEntry(key, value.toString());

  Future<bool> readBool(String key, bool defaultValue) async {
    final raw = await getEntry(key);
    if (raw == null) return defaultValue;
    return raw.toLowerCase() == 'true';
  }
}
