import 'package:flutter_ecommerce/core/feature/products/domain/models/product.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/repo/product_repo.dart';
import 'package:flutter_ecommerce/core/interactor/remote_use_case.dart';

import '../../../../utils/unit.dart';

class GetFeaturedProductsUc extends UseCaseRemote<List<Product>, Unit> {
  final IProductRepo _repo;

  GetFeaturedProductsUc(this._repo);

  @override
  Stream<List<Product>> execute(Unit? body) async* {
    yield await _repo.getFeaturedProducts();
  }
}
