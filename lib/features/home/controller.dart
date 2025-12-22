import 'dart:async';

import 'package:get/get.dart';
import 'package:shop/features/products/model/all_product.dart';
import '../../core/services/rest_api/fake_api_service.dart';




class HomePageController extends GetxController {
  var allProducts = <MainProduct>[].obs;
  var filteredProducts = <MainProduct>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;
  var searchQuery = ''.obs;

  Timer? _debounce;
  final FakeStoreService service = FakeStoreService();


  void search(String query) {
    searchQuery.value = query;


    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        filteredProducts.value = List.from(allProducts);
      } else {
        final lowerQuery = query.toLowerCase();
        filteredProducts.value = allProducts.where((product) {
          final title = product.title.toLowerCase() ?? '';
          final category = product.category.toLowerCase() ?? '';
          return title.contains(lowerQuery) || category.contains(lowerQuery);
        }).toList();
      }
    });
  }


  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      error.value = '';
      final response = await service.fetchProducts();
      allProducts.value = MainProduct.listFromJson(response);
      filteredProducts.value = List.from(allProducts);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
}
