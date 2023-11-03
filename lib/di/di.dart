import 'package:get_it/get_it.dart';

import 'package:flutter_academy_online_shop/networking/dio_client.dart';
import 'package:flutter_academy_online_shop/domain/repository/product_repository.dart';
import 'package:flutter_academy_online_shop/presentation/store/products_store.dart';

final class DI {
  static void setup() {
    GetIt.I.registerSingleton<DioClient>(DioClient());
    GetIt.I.registerSingleton<ProductsRepository>(
        ProductsRepository(GetIt.I.get<DioClient>()));
    GetIt.I.registerFactory<ProductsStore>(() {
      final repo = GetIt.I.get<ProductsRepository>();
      return ProductsStore(repo);
    });
  }

  static T get<T extends Object>() {
    return GetIt.I.get<T>();
  }
}
