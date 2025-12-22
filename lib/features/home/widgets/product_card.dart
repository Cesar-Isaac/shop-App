import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop/core/routes/routes.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/core/widgets/image.dart';
import 'package:shop/features/products/model/all_product.dart';


class ProductCard extends StatelessWidget {
  final MainProduct product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.toNamed(Pages.products_details.value, arguments: product.id),
      child: Container(
        decoration: BoxDecoration(
          color: StyleRepo.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: StyleRepo.lightGrey, width: 0.5),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: AppImage(
                  path: product.image,
                  type: ImageType.Network,
                  fit: BoxFit.cover,
                  errorWidget: Icon(
                    Icons.wifi_off_outlined,
                    color: StyleRepo.orange,
                  ),
                ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
