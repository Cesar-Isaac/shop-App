import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/services/state_management/widgets/obs_widget.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/core/widgets/image.dart';
import 'package:shop/core/widgets/svg_icon.dart';
import 'package:shop/features/products/product_details/controller.dart';
import 'package:shop/features/products/product_details/widgets/rating_stars.dart';
import 'package:shop/gen/assets.gen.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr(LocaleKeys.product_details),
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: ObsVariableBuilder(
        obs: controller.product,
        builder: (context, product) {
          return Column(
            children: [
              AppImage(
                path: product.image,
                type: ImageType.CachedNetwork,
                width: Get.width,
                height: 300,
              ),
              SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${tr(LocaleKeys.category)} :${product.category}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        product.description,
                        style: TextStyle(color: StyleRepo.darkGrey),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              "${controller.price.value} \$",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          RatingStars(rating: product.rating!.rate),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return controller.isLoading.value
                    ? CircularProgressIndicator()
                    : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: controller.addToCaart,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgIcon(
                              icon: Assets.icons.cart,
                              color: StyleRepo.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              tr(LocaleKeys.add_to_cart),
                              style: TextStyle(
                                color: StyleRepo.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
              }),
              SizedBox(height: 50),
            ],
          );
        },
      ),
    );
  }
}
