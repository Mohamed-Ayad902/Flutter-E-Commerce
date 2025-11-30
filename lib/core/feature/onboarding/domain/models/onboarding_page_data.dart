import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/core/extensions/context_extensions.dart';

import '../../../../utils/assets_constants.dart';

class PageData {
  final String imagePath;
  final String title;
  final String description;

  PageData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

extension OnboardingContextExtensions on BuildContext {
  List<PageData> get onboardingPages {
    final strings = localization;

    return [
      PageData(
        imagePath: Images.clothes,
        title: strings.clothesTitle,
        description: strings.clothesDescription,
      ),
      PageData(
        imagePath: Images.book,
        title: strings.booksTitle,
        description: strings.booksDescription,
      ),
      PageData(
        imagePath: Images.electronics,
        title: strings.electronicsTitle,
        description: strings.electronicsDescription,
      ),
    ];
  }
}

