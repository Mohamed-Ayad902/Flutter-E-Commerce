class AppAssets {
  static String books = _image(name: "books");
  static String clothes = _image(name: "clothes");
  static String electronics = _image(name: "electronics");
}

String _image({required String name, String extension = "jpeg"}) {
  return "assets/images/$name.$extension";
}
