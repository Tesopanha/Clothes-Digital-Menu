import 'package:get/get.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/brand.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_brands.dart';
import '../../domain/usecases/get_products.dart';

class MainController extends GetxController {
  final GetBrands getBrands;
  final GetProducts getProducts;
  final NetworkInfo networkInfo;

  MainController({
    required this.getBrands,
    required this.getProducts,
    required this.networkInfo,
  });

  final brands = <Brand>[].obs;
  final products = <Product>[].obs;
  final isLoading = false.obs;
  final isError = false.obs;
  final errorMessage = ''.obs;
  final selectedBrandId = RxnString();
  final isRefreshing = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAll();
  }

  Future<void> fetchAll() async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = '';
    try {
      if (!await networkInfo.isConnected) {
        throw Exception('No internet connection');
      }
      final fetchedBrands = await getBrands();
      brands.assignAll(fetchedBrands);
      await fetchProducts();
    } catch (e) {
      isError.value = true;
      errorMessage.value = e.toString();
      products.clear();
      brands.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = '';
    try {
      if (!await networkInfo.isConnected) {
        throw Exception('No internet connection');
      }
      final fetchedProducts = await getProducts(brandId: selectedBrandId.value);
      products.assignAll(fetchedProducts);
    } catch (e) {
      isError.value = true;
      errorMessage.value = e.toString();
      products.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void selectBrand(String? brandId) async {
    selectedBrandId.value = brandId;
    await fetchProducts();
  }

  Future<void> refreshAll() async {
    isRefreshing.value = true;
    await fetchAll();
    isRefreshing.value = false;
  }
}
