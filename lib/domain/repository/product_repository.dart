import 'package:dio/dio.dart';

import 'package:flutter_academy_online_shop/networking/dio_client.dart';
import 'package:flutter_academy_online_shop/networking/path.dart';
import 'package:flutter_academy_online_shop/domain/models/product.dart';

class ProductsRepository {
  ProductsRepository(this.dioClient);

  final DioClient dioClient;

  Future<List<Product>> fetchProducts() async {
    try {
      final List<dynamic> productsResponse = await dioClient.get(productsPath);

      return productsResponse
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException {
      rethrow;
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      final categoriesResponse = await dioClient.get(categoriesPath);

      return categoriesResponse.cast<String>();
    } on DioException {
      rethrow;
    }
  }
}
