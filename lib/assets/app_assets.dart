class AppAssets {
  static String books = _image(name: "books");
  static String clothes = _image(name: "clothes");
  static String electronics = _image(name: "electronics");
  static String email = _icon(name: "email");
  static String lock = _icon(name: "lock");
  static String facebook = _icon(name: "facebook");
  static String google = _icon(name: "google");
  static String profile = _icon(name: "profile");
  static String cartFilled = _icon(name: "cart_filled");
  static String cartNotFilled = _icon(name: "cart_not_filled");
  static String homeFilled = _icon(name: "home_filled");
  static String homeNotFilled = _icon(name: "home_not_filled");
  static String notificationNotFilled = _icon(name: "notification_not_filled");
  static String notificationFilled = _icon(name: "notification_filled");
  static String profileFilled = _icon(name: "profile_filled");
  static String profileNotFilled = _icon(name: "profile");
  static String favoriteNotFilled = _icon(name: "favorite_not_filled");
  static String favoriteFilled = _icon(name: "favorite_filled");
}

String _image({required String name, String extension = "jpeg"}) {
  return "assets/images/$name.$extension";
}

String _icon({required String name}) {
  return "assets/icons/$name.svg";
}
