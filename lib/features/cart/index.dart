import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/features/cart/controller.dart';
import 'package:shop/features/cart/widgets/app_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartPageController());

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          const CartAppBar(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.error.isNotEmpty) {
                return Center(
                  child: Text(
                    controller.error.value,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                );
              }

              final carts = controller.carts;
              if (carts.isEmpty) {
                return const Center(
                  child: Text(
                    "Cart is empty",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  await controller.fetchUserCart();
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: carts.length,
                  itemBuilder: (context, index) {
                    final cart = carts[index];

                    final double total = controller.calculateTotal(cart);

                    final products =
                        (cart.products ?? []).toList()..sort(
                          (a, b) =>
                              (a.productId ?? 0).compareTo(b.productId ?? 0),
                        );

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cart Id #${cart.id}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),

                          ...products.map((item) {
                            final product =
                                controller.productsMap[item.productId];
                            if (product == null) return const SizedBox();

                            final double itemTotal =
                                (product.price ?? 0) * (item.quantity ?? 0);

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      product.image ?? '',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (_, __, ___) => const Icon(
                                            Icons.image_not_supported,
                                            size: 60,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.title ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Quantity: ${item.quantity ?? 0}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          "Item Total: \$${itemTotal.toStringAsFixed(2)}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),

                          const Divider(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Total: \$${total.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
