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

  @readonly
  String _searchValue = '';

  @observable
  String selectedCategory = "";

  @observable
  ObservableList<String> allCategories = ObservableList<String>();

  @observable
  ObservableList<Product> filteredProducts = ObservableList<Product>();

  void setSearchValue(String value) {
    _searchValue = value;
    _filterProducts();
  }

  @action
  void setSelectedCategory(String category) {
    selectedCategory == category
        ? selectedCategory = ""
        : selectedCategory = category;
    _filterProducts();
  }

  @action
  Future fetchProductsAndCategories() async {
    isLoading = true;

    try {
      final response = await Future.wait([
        productsRepository.fetchProducts(),
        productsRepository.fetchCategories()
      ]);

      _allProducts.addAll(response.first as List<Product>);
      allCategories.addAll(response.elementAt(1) as List<String>);
      _filterProducts();
    } on DioException catch (ex) {
    } finally {
      isLoading = false;
    }
  }

  void _filterProducts() {
    filteredProducts.clear();

    if (selectedCategory.isNotEmpty || _searchValue.isNotEmpty) {
      final products = _allProducts.where((element) =>
          element.category.contains(selectedCategory) &&
          element.title.toLowerCase().contains(_searchValue.toLowerCase()));
      filteredProducts = ObservableList.of(products);
    } else {
      filteredProducts = ObservableList.of(_allProducts);
    }
  }

  // ReactionDisposer? _disposer;
  //
  // void _setupReactions() {
  //   _disposer = reaction(
  //     (_) => [selectedCategory, _searchValue, _allProducts],
  //     (_) => _filterProducts(),
  //   );
  // }
  //
  // void dispose() {
  //   _disposer?.call();
  // }
}
