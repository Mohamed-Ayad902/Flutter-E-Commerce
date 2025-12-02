class AppAssets {
  static String books = _image(name: "books");
  static String clothes = _image(name: "clothes");
  static String electronics = _image(name: "electronics");
  static String email = _icon(name: "email");
  static String lock = _icon(name: "lock");
  static String facebook = _icon(name: "facebook");
  static String google = _icon(name: "google");
}

String _image({required String name, String extension = "jpeg"}) {
  return "assets/images/$name.$extension";
}

String _icon({required String name}) {
  return "assets/icons/$name.svg";
}
