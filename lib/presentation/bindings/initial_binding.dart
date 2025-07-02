import 'package:get/get.dart';
import '../../core/network/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../data/datasources/brand_remote_data_source.dart';
import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/brand_repository_impl.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/usecases/get_brands.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/get_product_by_id.dart';
import '../controllers/main_controller.dart';
import '../controllers/product_detail_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Core
    Get.lazyPut(() => NetworkInfo(Connectivity()));

    // Data sources
    Get.lazyPut(() => BrandRemoteDataSource());
    Get.lazyPut(() => ProductRemoteDataSource());

    // Repositories
    Get.lazyPut(() => BrandRepositoryImpl(Get.find()));
    Get.lazyPut(() => ProductRepositoryImpl(Get.find()));

    // Use cases
    Get.lazyPut(() => GetBrands(Get.find<BrandRepositoryImpl>()));
    Get.lazyPut(() => GetProducts(Get.find<ProductRepositoryImpl>()));
    Get.lazyPut(() => GetProductById(Get.find<ProductRepositoryImpl>()),
        fenix: true);

    // Controllers
    Get.lazyPut(() => MainController(
          getBrands: Get.find(),
          getProducts: Get.find(),
          networkInfo: Get.find(),
        ));
    Get.lazyPut(
        () => ProductDetailController(
              getProductById: Get.find(),
              networkInfo: Get.find(),
            ),
        fenix: true);
  }
}
