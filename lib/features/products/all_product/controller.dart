import 'dart:async';
import 'package:get/get.dart';
import 'package:shop/features/products/model/all_product.dart';

class ProductsPageController extends GetxController {
  final RxList<MainProduct> allProducts = <MainProduct>[].obs;
  final RxList<MainProduct> filteredProducts = <MainProduct>[].obs;
  final RxString searchQuery = ''.obs;

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();


    final args = Get.arguments as List<MainProduct>;

    allProducts.assignAll(args);
    filteredProducts.assignAll(args);
  }

  void search(String query) {
    searchQuery.value = query;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (query.isEmpty) {
        filteredProducts.assignAll(allProducts);
      } else {
        final lower = query.toLowerCase();
        filteredProducts.assignAll(
          allProducts.where(
                (product) =>
            product.title.toLowerCase().contains(lower) ||
                product.category.toLowerCase().contains(lower),
          ),
        );
      }
    });
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }
}
