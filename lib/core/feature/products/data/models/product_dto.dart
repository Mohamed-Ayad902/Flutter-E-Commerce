import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../../../constants/constants.dart';

class ProductDto {
  final String id;
  final double avgRating;
  final String categoryId;
  final List<String> colors;
  final String currency;
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
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final String title;

  ProductDto({
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

  Map<String, dynamic> toMap() {
    return {
      Constants.id: id,
      Constants.avgRating: avgRating,
      Constants.categoryId: categoryId,
      Constants.colors: colors,
      Constants.currency: currency,
      Constants.description: description,
      Constants.discount: discount,
      Constants.images: images,
      Constants.isFeatured: isFeatured,
      Constants.isActive: isActive,
      Constants.metadata: metadata,
      Constants.originalPrice: originalPrice,
      Constants.latestPrice: latestPrice,
      Constants.ratingCount: ratingCount,
      Constants.sellerId: sellerId,
      Constants.sku: sku,
      Constants.amountInStock: amountInStock,
      Constants.createdAt: createdAt,
      Constants.updatedAt: updatedAt,
      Constants.title: title,
    };
  }

  /// Creates a ProductDto instance from a Firestore DocumentSnapshot.
  static ProductDto fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data() ?? {};
    return ProductDto(
      id: snapshot.id, // Use snapshot.id for the document ID
      avgRating: (data[Constants.avgRating] as num?)?.toDouble() ?? 0.0,
      categoryId: data[Constants.categoryId] as String? ?? '',
      colors: List<String>.from(data[Constants.colors] ?? []),
      currency: data[Constants.currency] as String? ?? '',
      description: data[Constants.description] as String? ?? '',
      discount: (data[Constants.discount] as num?)?.toDouble() ?? 0.0,
      images: List<String>.from(data[Constants.images] ?? []),
      isFeatured: data[Constants.isFeatured] as bool? ?? false,
      isActive: data[Constants.isActive] as bool? ?? false,
      metadata: (data[Constants.metadata] as List?)?.map((item) => Map<String, dynamic>.from(item)).toList() ?? [],
      originalPrice: (data[Constants.originalPrice] as num?)?.toDouble() ?? 0.0,
      latestPrice: (data[Constants.latestPrice] as num?)?.toDouble() ?? 0.0,
      ratingCount: data[Constants.ratingCount] as int? ?? 0,
      sellerId: data[Constants.sellerId] as String? ?? '',
      sku: data[Constants.sku] as String? ?? '',
      amountInStock: data[Constants.amountInStock] as int? ?? 0,
      createdAt: data[Constants.createdAt] as Timestamp? ?? Timestamp.now(),
      updatedAt: data[Constants.updatedAt] as Timestamp? ?? Timestamp.now(),
      title: data[Constants.title] as String? ?? '',
    );
  }
}

extension TimestampExtension on Timestamp {
  String toReadableString() {
    final dateTime = toDate();
    final formatter = DateFormat('MMM d, yyyy hh:mm a');
    return formatter.format(dateTime);
  }
}
