import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/services/rest_api/api_service.dart';
import 'package:shop/core/services/rest_api/constants/end_points.dart';
import 'package:shop/core/services/rest_api/models/request.dart';
import 'package:shop/core/services/rest_api/models/response_model.dart';
import 'package:shop/core/services/state_management/obs.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/features/products/product_details/model/product.dart';
import 'package:shop/features/profile/controller.dart';

class ProductDetailsPageController extends GetxController {
  late final int id;
  ObsVar<Product> product = ObsVar(null);
  var isLoading = false.obs;

  final controllerProfile = Get.find<ProfilePageController>();

  RxDouble price = 0.0.obs;
  Future<void> addToCaart() async {
    isLoading.value = true;
    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.addToCart,
        method: RequestMethod.Post,
        body: {
          "id": id,
          "userId": controllerProfile.userId,
          "products": [
            {
              "id": product.value!.id,
              "title": product.value!.title,
              "price": product.value!.price,
              "description": product.value!.description,
              "category": product.value!.category,
              "image": product.value!.image,
            },
          ],
        },
      ),
    );
    isLoading.value = false;
    if (response.success) {
      log(controllerProfile.userId.toString());
      Get.snackbar(
        tr(LocaleKeys.success),
        "",
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.green,
        colorText: StyleRepo.white,
      );
    } else {
      Get.snackbar(
        tr(LocaleKeys.error),
        "",
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.red,
        colorText: StyleRepo.white,
      );
    }
  }

  fetch() async {
    log("FETCH CALLED");
    ResponseModel response = await APIService.instance.request(
      Request(endPoint: EndPoints.product(id)),
    );

    if (response.success) {
      product.value = Product.fromJson(response.data as Map<String, dynamic>);
      price.value = product.value!.price;
    } else {
      product.error = response.message;
    }
  }

  @override
  void onInit() {
    id = Get.arguments;
    log(id.toString());
    fetch();
    super.onInit();
  }
}
