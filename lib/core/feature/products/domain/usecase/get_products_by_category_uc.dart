import 'package:flutter_ecommerce/core/exceptions/exceptions.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/models/product.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/repo/product_repo.dart';
import 'package:flutter_ecommerce/core/interactor/remote_use_case.dart';

class GetProductsByCategoryUc extends UseCaseRemote<List<Product>, String> {
  final IProductRepo _repo;

  GetProductsByCategoryUc(this._repo);

  @override
  Stream<List<Product>> execute(String? body) async* {
    if(body == null) throw InvalidRequestBody('CategoryId is required');
    yield await _repo.getProductsByCategoryId(body);
  }
}
