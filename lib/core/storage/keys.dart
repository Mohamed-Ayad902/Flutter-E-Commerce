enum StorageKey {
  isFirstAppRun,
  token,
  session
}


extension StorageKeyExt on StorageKey {
  String get key {
    switch (this) {
      case StorageKey.isFirstAppRun:
        return 'isFirstAppRun';
      case StorageKey.token:
        return "token";
      case StorageKey.session:
        return "session";
    }
  }
}