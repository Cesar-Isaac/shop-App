// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shop/core/models/product/product.dart';
// import 'package:shop/core/routes/routes.dart';
// import 'package:shop/core/style/repo.dart';
// import 'package:shop/core/widgets/image.dart';
// import 'package:shop/core/widgets/svg_icon.dart';
// import 'package:shop/gen/assets.gen.dart';
//
// import '../../../core/constants/controllers_tags.dart';
// import '../../../core/services/pagination/options/list_view.dart';
// import '../../../core/widgets/error_widget.dart';
// import '../../home/controller.dart';
//
// class ProductCard extends StatelessWidget {
//   const ProductCard({super.key, required this.controller,});
//   final HomePageController controller;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ListViewPagination.separated(
//       padding: const EdgeInsets.only(bottom: 80, left: 16, right: 16),
//       physics: const AlwaysScrollableScrollPhysics(),
//       // errorWidget:
//       //     (error) =>
//       //     AppErrorWidget(error: error, onRetry: controller.refreshData),
//       // Text(error),
//       onControllerInit:
//           (pagerController) => controller.pagerController = pagerController,
//       itemBuilder: (context, index, getAllProduct) {
//         final product = getAllProduct;
//         return InkWell(
//           // onTap:
//           //     () => Get.toNamed(Pages.order_details.value, arguments: order),
//           child: Container(
//             width: MediaQuery.sizeOf(context).width * .4,
//             decoration: BoxDecoration(
//               color: StyleRepo.white,
//               borderRadius: BorderRadius.circular(18),
//               border: Border.all(color: StyleRepo.lightGrey),
//             ),
//             child: Column(
//               children: [
//                 AppImage(
//                   height: 150,
//                   width: double.infinity,
//                   path: product.image,
//                   type: ImageType.CachedNetwork,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(18),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         product.title,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       Text(
//                         product.description,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       Row(
//                         children: [
// // Expanded(child: Text("\$${product.price}")),
//                           Text("\$${product.price}"),
//
//                           Container(
//                             height: 45,
//                             width: 45,
//                             padding: EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: Theme.of(context).primaryColor,
//                               borderRadius: BorderRadius.circular(17),
//                             ),
//                             child: SvgIcon(
//                               icon: Assets.icons.add,
//                               color: StyleRepo.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       separatorBuilder: (_, __) => SizedBox(height: 10),
//       tag: ControllersTags.products_pager,
//       fetchApi: controller.fetchProducts,
//       fromJson: MainProduct.fromJson,
//     );
//   }
// }
