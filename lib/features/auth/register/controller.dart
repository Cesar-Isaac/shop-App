import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/config/app_builder.dart';
import 'package:shop/core/config/role.dart';
import 'package:shop/core/routes/routes.dart';
import 'package:shop/core/services/rest_api/api_service.dart';
import 'package:shop/core/services/rest_api/constants/end_points.dart';
import 'package:shop/core/services/rest_api/models/request.dart';
import 'package:shop/core/services/rest_api/models/response_model.dart';
import 'package:shop/core/style/repo.dart';

class RegisterController extends GetxController {
  late TextEditingController username, password, email, number, firstName, lastName;
  final AppBuilder appBuilder = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.register,
        method: RequestMethod.Post,
        body: {
          "phone": number.text,
          "username": username.text,
          "email": email.text,
          "password": password.text,
          "name": {"firstname": firstName.text, "lastname": lastName.text},
          //These values should be taken from a map in order to update the address; however, due to their unavailability, they were hardcoded.
          "address": {
            "city": "New York",
            "street": "Main Street",
            "number": 12,
            "zipcode": "10001",
            "geolocation": {"lat": "-37.3159", "long": "81.1496"},
          },
        },
      ),
    );

    isLoading.value = false;
    debugPrint(
      "Number : ${number.text}, username : ${username.text}, email: ${email.text},password: ${password.text},",
    );

    if (response.success) {
      final token = response.data != null ? response.data['token'] : null;

      appBuilder.setRole(Role.user);
      appBuilder.setToken(token);
      Get.offAllNamed(Pages.home.value);

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

  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.toggle();
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    password.dispose();
    number.dispose();
    firstName.dispose();
    lastName.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    username = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    number = TextEditingController();
    super.onInit();
  }
}
