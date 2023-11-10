import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_academy_online_shop/domain/repository/product_repository.dart';
import 'package:flutter_academy_online_shop/domain/models/product.dart';
import 'package:flutter_academy_online_shop/domain/models/shopping_cart.dart';

part 'shop_store.g.dart';

class ShopStore extends _ShopStore with _$ShopStore {
  ShopStore(super.productsRepository);
}

abstract class _ShopStore with Store {
  _ShopStore(this.productsRepository);

  final ProductsRepository productsRepository;

  @observable
  bool isLoading = false;

  @readonly
  String _searchValue = '';

  @observable
  String selectedCategory = "";

  @observable
  ObservableList<String> allCategories = ObservableList<String>();

  @observable
  ObservableList<Product> allProducts = ObservableList<Product>();

  @observable
  ObservableList<Product> filteredProducts = ObservableList<Product>();

  @observable
  ObservableList<ShoppingCartItemRecord> shoppingCart =
      ObservableList<ShoppingCartItemRecord>();

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

      allCategories.addAll(response.elementAt(1) as List<String>);
      allProducts = ObservableList.of(response.first as List<Product>);

      _filterProducts();
    } on DioException catch (ex) {
    } finally {
      isLoading = false;
    }
  }

  @action
  void addToCart(int id, int amount, num itemPrice) {
    final itemIndex = shoppingCart.indexWhere((item) => item.id == id);

    if (itemIndex == -1) {
      shoppingCart.add((id: id, amount: amount, itemPrice: itemPrice));
    } else {
      final cartItem = shoppingCart[itemIndex];
      final updatedItem = (
        id: cartItem.id,
        amount: cartItem.amount + amount,
        itemPrice: cartItem.itemPrice
      );

      shoppingCart[itemIndex] = updatedItem;
    }
  }

  @action
  void removeFromCart(index) {
    shoppingCart.removeAt(index);
  }

  void _filterProducts() {
    filteredProducts.clear();

    if (selectedCategory.isNotEmpty || _searchValue.isNotEmpty) {
      final products = allProducts.where((element) =>
          element.category == selectedCategory &&
          element.title.toLowerCase().contains(_searchValue.toLowerCase()));
      filteredProducts = ObservableList.of(products);
    } else {
      filteredProducts = ObservableList.of(allProducts);
    }
  }
}