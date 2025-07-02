import '../../domain/entities/product.dart';
import '../../domain/entities/brand.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts(
      {int page = 1, int limit = 10, String? brandId}) async {
    final models = await remoteDataSource.getProducts(
        page: page, limit: limit, brandId: brandId);
    return models.map(_mapProductModelToEntity).toList();
  }

  @override
  Future<Product> getProductById(String id) async {
    final model = await remoteDataSource.getProductById(id);
    return _mapProductModelToEntity(model);
  }

  Product _mapProductModelToEntity(ProductModel model) {
    return Product(
      id: model.id,
      name: model.name,
      brand: Brand(
        id: model.brand.id,
        name: model.brand.name,
        logoURL: model.brand.logoURL,
      ),
      variants: model.variants
          .map((v) => Variant(
                variantId: v.variantId,
                colors:
                    v.colors.map((c) => Color(id: c.id, name: c.name)).toList(),
                size: Size(id: v.size.id, name: v.size.name),
                stock: v.stock,
                images: v.images
                    .map((i) =>
                        ProductImage(imageURL: i.imageURL, isMain: i.isMain))
                    .toList(),
              ))
          .toList(),
    );
  }
}
