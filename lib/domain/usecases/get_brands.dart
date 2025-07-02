import '../entities/brand.dart';
import '../repositories/brand_repository.dart';

class GetBrands {
  final BrandRepository repository;

  GetBrands(this.repository);

  Future<List<Brand>> call() async {
    return await repository.getBrands();
  }
}
