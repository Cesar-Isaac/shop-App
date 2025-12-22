import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/localization/strings.dart';
import 'package:shop/core/widgets/svg_icon.dart';
import 'package:shop/gen/assets.gen.dart';

import '../controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainPageController>();
    return Obx(
          () => NavigationBar(
        onDestinationSelected: (page) => controller.currentPage.value = page,
        selectedIndex: controller.currentPage.value,
        destinations: [
          NavigationDestination(
            icon: SvgIcon(icon: Assets.icons.home),
            // icon: Icon(Icons.home),
            label: tr(LocaleKeys.home),
          ),
          NavigationDestination(
            icon: SvgIcon(icon: Assets.icons.cart),
            label: tr(LocaleKeys.cart),
          ),

          NavigationDestination(
            icon: SvgIcon(icon: Assets.icons.profile),
            label: tr(LocaleKeys.account),
          ),
        ],
      ),
    );
  }
}
