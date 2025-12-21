import '../../../../base/base_mapper.dart';
import '../../domain/models/product.dart';
import '../models/product_dto.dart';

class ProductMapper implements IMapper<ProductDto, Product> {
  @override
  Product dtoToDomain(ProductDto dto) {
    return Product(
      id: dto.id,
      avgRating: dto.avgRating,
      categoryId: dto.categoryId,
      colors: List<String>.from(dto.colors),
      currency: Currency.values.firstWhere(
        (e) => e.name == dto.currency,
        orElse: () => Currency.egp,
      ),
      description: dto.description,
      discount: dto.discount,
      images: List<String>.from(dto.images),
      isFeatured: dto.isFeatured,
      isActive: dto.isActive,
      metadata: List<Map<String, dynamic>>.from(dto.metadata),
      originalPrice: dto.originalPrice,
      latestPrice: dto.latestPrice,
      ratingCount: dto.ratingCount,
      sellerId: dto.sellerId,
      sku: dto.sku,
      amountInStock: dto.amountInStock,
      createdAt: dto.createdAt.toReadableString(),
      updatedAt: dto.updatedAt.toReadableString(),
      title: dto.title,
    );
  }
}
