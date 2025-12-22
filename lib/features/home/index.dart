import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/features/home/widgets/home_app_bar.dart';
import 'controller.dart';
import 'widgets/ads.dart';
import 'widgets/products_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    return Column(
      children: [
        HomeAppBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                TextFormField(
                  onChanged: (value) => controller.search(value),
                  decoration: InputDecoration(
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    prefixIcon: Icon(Icons.search, color: StyleRepo.darkGrey),
                    hintText: tr(LocaleKeys.search),
                  ),
                ),
                SizedBox(height: 16),
                AdsWidget(),
                SizedBox(height: 16),
                ProductsSection(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
