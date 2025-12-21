import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/models/product.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/repo/product_repo.dart';
import 'package:flutter_ecommerce/core/firebase/firestore_utils.dart';

import '../../../../constants/constants.dart';
import '../mapper/product_mapper.dart';
import '../models/product_dto.dart';

class ProductRepo implements IProductRepo {
  final FirebaseUtils _firebaseUtils;

  ProductRepo(this._firebaseUtils);

  @override
  Future<List<Product>> getFeaturedProducts() async {
    final ProductMapper productMapper = ProductMapper();

    return await _firebaseUtils.getAllItems(
        collectionPath: [
          Constants.products
        ],
        queryOperations: [
          WhereEqualTo(Constants.isFeatured, true),
          WhereEqualTo(Constants.isActive, true),
        ],
        mapper: (snapshot) {
          final doc = snapshot as DocumentSnapshot<Map<String, dynamic>>;
          final dto = ProductDto.fromFirestore(doc);
          return productMapper.dtoToDomain(dto);
        });
  }

  @override
  Future<List<Product>> getProductsByCategoryId(String catId) async {
    final ProductMapper productMapper = ProductMapper();

    return await _firebaseUtils.getAllItems(
        collectionPath: [Constants.products],
        queryOperations: [WhereEqualTo(Constants.category, catId)],
        mapper: (ds) {
          final doc = ds as DocumentSnapshot<Map<String, dynamic>>;
          final dto = ProductDto.fromFirestore(doc);
          return productMapper.dtoToDomain(dto);
        });
  }
}
