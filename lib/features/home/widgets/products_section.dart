import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/routes/routes.dart';
import 'package:shop/features/home/widgets/product_card.dart';
import '../controller.dart';
import 'content_list.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.error.value.isNotEmpty) {
        return Center(child: Text(controller.error.value));
      }

      if (controller.filteredProducts.isEmpty) {
        return const Center(child: Text("No products"));
      }

      return HomeContentList(
        title: tr(LocaleKeys.all_products),
        seeAll: () => Get.toNamed(
          Pages.all_product.value,
          arguments: controller.filteredProducts,
        ),
        content: LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = constraints.maxWidth * 0.45;

            return SizedBox(
              height: cardWidth + 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.filteredProducts.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final product = controller.filteredProducts[index];
                  return SizedBox(
                    width: cardWidth,
                    child: ProductCard(product: product),
                  );
                },
              ),
            );
          },
        ),
      );
    });
  }
}




