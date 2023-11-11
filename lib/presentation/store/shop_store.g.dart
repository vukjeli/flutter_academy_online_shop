// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShopStore on _ShopStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ShopStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isPaymentInProgressAtom =
      Atom(name: '_ShopStore.isPaymentInProgress', context: context);

  @override
  bool get isPaymentInProgress {
    _$isPaymentInProgressAtom.reportRead();
    return super.isPaymentInProgress;
  }

  @override
  set isPaymentInProgress(bool value) {
    _$isPaymentInProgressAtom.reportWrite(value, super.isPaymentInProgress, () {
      super.isPaymentInProgress = value;
    });
  }

  late final _$_searchValueAtom =
      Atom(name: '_ShopStore._searchValue', context: context);

  String get searchValue {
    _$_searchValueAtom.reportRead();
    return super._searchValue;
  }

  @override
  String get _searchValue => searchValue;

  @override
  set _searchValue(String value) {
    _$_searchValueAtom.reportWrite(value, super._searchValue, () {
      super._searchValue = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_ShopStore.selectedCategory', context: context);

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$allCategoriesAtom =
      Atom(name: '_ShopStore.allCategories', context: context);

  @override
  ObservableList<String> get allCategories {
    _$allCategoriesAtom.reportRead();
    return super.allCategories;
  }

  @override
  set allCategories(ObservableList<String> value) {
    _$allCategoriesAtom.reportWrite(value, super.allCategories, () {
      super.allCategories = value;
    });
  }

  late final _$allProductsAtom =
      Atom(name: '_ShopStore.allProducts', context: context);

  @override
  ObservableList<Product> get allProducts {
    _$allProductsAtom.reportRead();
    return super.allProducts;
  }

  @override
  set allProducts(ObservableList<Product> value) {
    _$allProductsAtom.reportWrite(value, super.allProducts, () {
      super.allProducts = value;
    });
  }

  late final _$filteredProductsAtom =
      Atom(name: '_ShopStore.filteredProducts', context: context);

  @override
  ObservableList<Product> get filteredProducts {
    _$filteredProductsAtom.reportRead();
    return super.filteredProducts;
  }

  @override
  set filteredProducts(ObservableList<Product> value) {
    _$filteredProductsAtom.reportWrite(value, super.filteredProducts, () {
      super.filteredProducts = value;
    });
  }

  late final _$shoppingCartAtom =
      Atom(name: '_ShopStore.shoppingCart', context: context);

  @override
  ObservableList<({int amount, Product product})> get shoppingCart {
    _$shoppingCartAtom.reportRead();
    return super.shoppingCart;
  }

  @override
  set shoppingCart(ObservableList<({int amount, Product product})> value) {
    _$shoppingCartAtom.reportWrite(value, super.shoppingCart, () {
      super.shoppingCart = value;
    });
  }

  late final _$fetchProductsAndCategoriesAsyncAction =
      AsyncAction('_ShopStore.fetchProductsAndCategories', context: context);

  @override
  Future<dynamic> fetchProductsAndCategories() {
    return _$fetchProductsAndCategoriesAsyncAction
        .run(() => super.fetchProductsAndCategories());
  }

  late final _$payOrderAsyncAction =
      AsyncAction('_ShopStore.payOrder', context: context);

  @override
  Future<void> payOrder() {
    return _$payOrderAsyncAction.run(() => super.payOrder());
  }

  late final _$_ShopStoreActionController =
      ActionController(name: '_ShopStore', context: context);

  @override
  void setSearchValue(String value) {
    final _$actionInfo = _$_ShopStoreActionController.startAction(
        name: '_ShopStore.setSearchValue');
    try {
      return super.setSearchValue(value);
    } finally {
      _$_ShopStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedCategory(String category) {
    final _$actionInfo = _$_ShopStoreActionController.startAction(
        name: '_ShopStore.setSelectedCategory');
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$_ShopStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCart(Product product, int amount) {
    final _$actionInfo =
        _$_ShopStoreActionController.startAction(name: '_ShopStore.updateCart');
    try {
      return super.updateCart(product, amount);
    } finally {
      _$_ShopStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteFromCart(dynamic product) {
    final _$actionInfo = _$_ShopStoreActionController.startAction(
        name: '_ShopStore.deleteFromCart');
    try {
      return super.deleteFromCart(product);
    } finally {
      _$_ShopStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isPaymentInProgress: ${isPaymentInProgress},
selectedCategory: ${selectedCategory},
allCategories: ${allCategories},
allProducts: ${allProducts},
filteredProducts: ${filteredProducts},
shoppingCart: ${shoppingCart}
    ''';
  }
}
