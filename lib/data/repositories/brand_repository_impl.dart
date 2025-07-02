import '../../domain/entities/brand.dart';
import '../../domain/repositories/brand_repository.dart';
import '../datasources/brand_remote_data_source.dart';

class BrandRepositoryImpl implements BrandRepository {
  final BrandRemoteDataSource remoteDataSource;

  BrandRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Brand>> getBrands() async {
    final models = await remoteDataSource.getBrands();
    return models
        .map((e) => Brand(id: e.id, name: e.name, logoURL: e.logoURL))
        .toList();
  }
}
