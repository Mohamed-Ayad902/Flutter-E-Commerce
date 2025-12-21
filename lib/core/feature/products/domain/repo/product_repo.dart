import 'package:flutter_ecommerce/core/feature/products/domain/models/product.dart';

abstract class IProductRepo{
  Future<List<Product>> getFeaturedProducts();
  Future<List<Product>> getProductsByCategoryId(String catId);
}