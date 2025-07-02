import 'package:get/get.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_product_by_id.dart';

class ProductDetailController extends GetxController {
  final GetProductById getProductById;
  final NetworkInfo networkInfo;

  ProductDetailController({
    required this.getProductById,
    required this.networkInfo,
  });

  final product = Rxn<Product>();
  final isLoading = false.obs;
  final isError = false.obs;
  final errorMessage = ''.obs;

  Future<void> fetchProduct(String id) async {
    isLoading.value = true;
    isError.value = false;
    errorMessage.value = '';
    try {
      if (!await networkInfo.isConnected) {
        throw Exception('No internet connection');
      }
      final fetchedProduct = await getProductById(id);
      product.value = fetchedProduct;
    } catch (e) {
      isError.value = true;
      errorMessage.value = e.toString();
      product.value = null;
    } finally {
      isLoading.value = false;
    }
  }
}
