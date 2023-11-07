// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsStore on _ProductsStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ProductsStore.isLoading', context: context);

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

  late final _$_searchValueAtom =
      Atom(name: '_ProductsStore._searchValue', context: context);

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
      Atom(name: '_ProductsStore.selectedCategory', context: context);

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
      Atom(name: '_ProductsStore.allCategories', context: context);

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

  late final _$filteredProductsAtom =
      Atom(name: '_ProductsStore.filteredProducts', context: context);

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

  late final _$fetchProductsAndCategoriesAsyncAction = AsyncAction(
      '_ProductsStore.fetchProductsAndCategories',
      context: context);

  @override
  Future<dynamic> fetchProductsAndCategories() {
    return _$fetchProductsAndCategoriesAsyncAction
        .run(() => super.fetchProductsAndCategories());
  }

  late final _$_ProductsStoreActionController =
      ActionController(name: '_ProductsStore', context: context);

  @override
  void setSelectedCategory(String category) {
    final _$actionInfo = _$_ProductsStoreActionController.startAction(
        name: '_ProductsStore.setSelectedCategory');
    try {
      return super.setSelectedCategory(category);
    } finally {
      _$_ProductsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedCategory: ${selectedCategory},
allCategories: ${allCategories},
filteredProducts: ${filteredProducts}
    ''';
  }
}
