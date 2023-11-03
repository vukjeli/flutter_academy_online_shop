import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_academy_online_shop/domain/repository/product_repository.dart';
import 'package:flutter_academy_online_shop/domain/models/product.dart';

part 'products_store.g.dart';

class ProductsStore extends _ProductsStore with _$ProductsStore {
  ProductsStore(super.productsRepository);
}

abstract class _ProductsStore with Store {
  _ProductsStore(this.productsRepository);

  final ProductsRepository productsRepository;
  final List<Product> _allProducts = [];

  @observable
  bool isLoading = false;

  @observable
  List<String> allCategories = [];

  Future fetchProductsAndCategories() async {
    isLoading = true;

    try {
      final response = await Future.wait([
        productsRepository.fetchProducts(),
        productsRepository.fetchCategories()
      ]);

      // Clear only for local dev
      allCategories.clear();
      _allProducts.clear();

      _allProducts.addAll(response.first as List<Product>);
      allCategories.addAll(response.elementAt(1) as List<String>);
    } on DioException catch (ex) {
    } finally {
      isLoading = false;
    }
  }
}
