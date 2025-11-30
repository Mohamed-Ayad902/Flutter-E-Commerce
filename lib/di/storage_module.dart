import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../core/storage/data_store.dart';
import '../core/storage/flutter_secure_storage.dart';
import '../core/storage/storage.dart';
import '../core/storage/storage_file.dart';

Future<void> registerStorageModule(GetIt getIt) async {
  getIt.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());

  getIt.registerLazySingleton<IStorageKeyValue>(() => FlutterSecureStorageAdapter(secureStorage: getIt<FlutterSecureStorage>()));

  getIt.registerLazySingleton<IStorageKeyValueFile>(() => DataStoreFile(getIt<IStorageKeyValue>()));
}