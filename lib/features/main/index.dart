import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/style/repo.dart';
import 'package:shop/features/home/index.dart';
import 'package:shop/features/main/controller.dart';

import '../cart/index.dart';
import '../profile/index.dart';
import 'widgets/nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainPageController());
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: Obx(
            () => switch (controller.currentPage.value) {
          0 => HomePage(),
          1 => CartPage(),
          2 => ProfilePage(),
          _ => ColoredBox(color: StyleRepo.orange),
        },
      ),
    );
  }
}
