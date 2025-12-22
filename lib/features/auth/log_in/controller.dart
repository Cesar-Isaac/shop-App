import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/config/app_builder.dart';
import 'package:shop/core/config/role.dart';
import 'package:shop/core/routes/routes.dart';
import 'package:shop/core/services/rest_api/constants/end_points.dart';
import 'package:shop/core/services/rest_api/models/request.dart';
import 'package:shop/core/style/repo.dart';

import '../../../core/services/rest_api/api_service.dart';

class LoginController extends GetxController {
  final AppBuilder appBuilder = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController username, password;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    final response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.login,
        method: RequestMethod.Post,
        header: {"Content-Type": "application/json"},
        body: {
          "username": username.text.trim(),
          "password": password.text.trim(),
        },
      ),
    );

    isLoading.value = false;
    debugPrint(" username : ${username.text},password: ${password.text},");
    if (response.success) {
      final token = response.data != null ? response.data['token'] : null;

      if (token != null) {
        appBuilder.setRole(Role.user);
        appBuilder.setToken(token);

        appBuilder.box.write("isLoggedIn", true);
        appBuilder.box.write("token", token);

        appBuilder.box.write("username", username.text.trim());

        Get.offAllNamed(Pages.home.value);

        debugPrint("token : $token");
        debugPrint(response.message);
      } else {
        Get.snackbar(
          "Error",
          "Token not found",
          snackPosition: SnackPosition.TOP,
          backgroundColor: StyleRepo.red,
          colorText: StyleRepo.white,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        response.message.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: StyleRepo.red,
        colorText: StyleRepo.white,
      );
    }
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  final isPasswordHidden = true.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }
}
