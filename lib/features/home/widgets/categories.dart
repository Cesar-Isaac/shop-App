import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/services/state_management/widgets/obs_widget.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/core/widgets/image.dart';

import '../controller.dart';
import 'content_list.dart';

// class CategoriesSection extends StatelessWidget {
//   const CategoriesSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<HomePageController>();
//     return HomeContentList(
//       title: "Categories",
//       content: ObsListBuilder(
//         obs: controller.categories,
//         builder: (context, categories) {
//           return SizedBox(
//             height: 120,
//             child: ListView.separated(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               scrollDirection: Axis.horizontal,
//               itemCount: categories.length,
//               separatorBuilder: (_, __) => SizedBox(width: 12),
//               itemBuilder: (context, index) {
//                 return Container(
//                   width: Get.width * .7,
//                   decoration: BoxDecoration(
//                     color: StyleRepo.sandyBrown.withValues(alpha: 0.2),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Row(
//                     children: [
//                       AspectRatio(
//                         aspectRatio: 1,
//                         child: AppImage(
//                           path: categories[index].image,
//                           type: ImageType.CachedNetwork,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           categories[index].name,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
