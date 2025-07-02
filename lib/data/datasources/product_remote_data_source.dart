import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductRemoteDataSource {
  static const String baseUrl = 'http://10.0.2.2:3000';

  Future<List<ProductModel>> getProducts(
      {int page = 1, int limit = 10, String? brandId}) async {
    final queryParameters = {
      'page': page.toString(),
      'limit': limit.toString(),
      if (brandId != null) 'brand': brandId,
    };
    final uri = Uri.parse('$baseUrl/api/v1/products')
        .replace(queryParameters: queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List products = data['data'];
      return products.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductModel> getProductById(String id) async {
    final uri = Uri.parse('$baseUrl/api/v1/products/$id');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProductModel.fromJson(data['data']);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
