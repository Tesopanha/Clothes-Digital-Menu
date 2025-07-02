import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call(
      {int page = 1, int limit = 10, String? brandId}) async {
    return await repository.getProducts(
        page: page, limit: limit, brandId: brandId);
  }
}
