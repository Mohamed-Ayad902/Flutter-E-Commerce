import 'package:flutter_ecommerce/core/feature/products/domain/repo/product_repo.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/usecase/get_featured_products_uc.dart';
import 'package:flutter_ecommerce/core/feature/products/domain/usecase/get_products_by_category_uc.dart';
import 'package:get_it/get_it.dart';

import 'data/repo/product_repo.dart';

Future<void> registerProductsModule(GetIt getIt) async {
  getIt.registerLazySingleton<IProductRepo>(() => ProductRepo(getIt()));

  getIt.registerLazySingleton<GetFeaturedProductsUc>(() => GetFeaturedProductsUc(getIt()));
  getIt.registerLazySingleton<GetProductsByCategoryUc>(() => GetProductsByCategoryUc(getIt()));
}
