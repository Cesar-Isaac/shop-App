import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/config/app_builder.dart';
import 'package:shop/core/routes/routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> rotation;
    final appBuilder = Get.put(AppBuilder());
    
     Future<void> loadData() async {
    await 2.seconds.delay();
    appBuilder.init();
  }


  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    rotation = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(animationController);

   loadData();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
