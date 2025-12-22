import 'dart:developer';
import 'package:get/get.dart';
import 'package:shop/core/services/rest_api/api_service.dart';
import 'package:shop/core/services/rest_api/constants/end_points.dart';
import 'package:shop/core/services/rest_api/fake_api_service.dart';
import 'package:shop/core/services/rest_api/models/request.dart';
import 'package:shop/core/services/rest_api/models/response_model.dart';
import 'package:shop/features/cart/models/cart_model.dart';
import 'package:shop/features/products/model/all_product.dart';
import 'package:shop/features/profile/controller.dart';

class CartPageController extends GetxController {
  var carts = <CartModel>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  var productsMap = <int, MainProduct>{}.obs;

  final FakeStoreService service = FakeStoreService();
  final ProfilePageController profileController = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchUserCart();
  }

  Future<void> fetchUserCart() async {
    try {
      isLoading.value = true;
      error.value = '';

      final userId = profileController.userId;
      if (userId == null) {
        error.value = 'User not found';
        return;
      }

      final fetchedProducts = await service.fetchProducts();
      final productsList = MainProduct.listFromJson(fetchedProducts);
      productsMap.assignAll({for (var p in productsList) p.id!: p});

      ResponseModel response = await APIService.instance.request(
        Request(
          endPoint: EndPoints.carts(userId),
          fromJson: CartModel.fromJson,
        ),
      );

      if (!response.success) {
        error.value = response.message.toString();
        return;
      }

      if (response.data is Map<String, dynamic>) {
        final cart = CartModel.fromJson(response.data);
        carts.assignAll([cart]);
      } else if (response.data is List) {
        final list =
            (response.data as List).map((e) => CartModel.fromJson(e)).toList();
        carts.assignAll(list);
      } else {
        throw Exception(
          'Unexpected response type: ${response.data.runtimeType}',
        );
      }

      log('Loaded cart for userId=$userId');
    } catch (e) {
      error.value = e.toString();
      log('Error fetching user cart: $e');
    } finally {
      isLoading.value = false;
    }
  }

  double calculateTotal(CartModel cart) {
    double total = 0;
    for (var item in cart.products ?? []) {
      final product = productsMap[item.productId];
      if (product != null && item.quantity != null) {
        total += (product.price ?? 0) * item.quantity!;
      }
    }
    return total;
  }
}
