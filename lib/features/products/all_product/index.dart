import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/strings.dart';
import '../../../core/style/repo.dart';
import '../../home/widgets/product_card.dart';
import 'controller.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsPageController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(tr(LocaleKeys.all_products)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: controller.search,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: StyleRepo.darkGrey),
                hintText: tr(LocaleKeys.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          /// Grid Reactive
          Expanded(
            child: Obx(
              () => GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: controller.filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220, // Responsive
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final product = controller.filteredProducts[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
