

class Product {
  final String id;
  final double avgRating;
  final String categoryId;
  final List<String> colors;
  final Currency currency;
  final String description;
  final double discount;
  final List<String> images;
  final bool isFeatured;
  final bool isActive;
  final List<Map<String, dynamic>> metadata;
  final double originalPrice;
  final double latestPrice;
  final int ratingCount;
  final String sellerId;
  final String sku;
  final int amountInStock;
  final String createdAt;
  final String updatedAt;
  final String title;

  Product({
    required this.id,
    required this.avgRating,
    required this.categoryId,
    required this.colors,
    required this.currency,
    required this.description,
    required this.discount,
    required this.images,
    required this.isFeatured,
    required this.isActive,
    required this.metadata,
    required this.originalPrice,
    required this.latestPrice,
    required this.ratingCount,
    required this.sellerId,
    required this.sku,
    required this.amountInStock,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
  });
}

enum Currency { usd, egp }

extension CurrencyExtension on Currency {
  String get symbol {
    switch (this) {
      case Currency.usd: return '\$';
      case Currency.egp: return '£';
    }
  }
}
