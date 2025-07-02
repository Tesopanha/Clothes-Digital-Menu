import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/brand_model.dart';

class BrandRemoteDataSource {
  static const String baseUrl = 'http://10.0.2.2:3000';

  Future<List<BrandModel>> getBrands() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/brands'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List brands = data['data'];
      return brands.map((e) => BrandModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load brands');
    }
  }
}
