import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/core/config/app_builder.dart';
import 'package:shop/core/routes/routes.dart';
import 'package:shop/core/services/rest_api/fake_api_service.dart';
import 'package:shop/features/profile/model/all_user.dart';

class ProfilePageController extends GetxController {
  // =================== Dependencies ===================
  final AppBuilder appBuilder = Get.find();
  final FakeStoreService service = FakeStoreService();

  // =================== Observables ===================
  final RxBool isTranslate = false.obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  late String? savedUsername;

  // =================== Getter for userId ===================
  int? get userId => currentUser.value?.id;

  // =================== Lifecycle ===================
  @override
  void onInit() {
    super.onInit();
    savedUsername = appBuilder.box.read("username");
    fetchCurrentUser();
  }

  // =================== Users ===================
  Future<void> fetchCurrentUser() async {
    if (savedUsername == null || savedUsername!.isEmpty) {
      error.value = 'No username saved locally';
      return;
    }

    try {
      isLoading.value = true;
      error.value = '';

      final allUsers = await service.fetchUsers();

      // Find the user whose username matches the savedUsername
      final user = allUsers.firstWhere(
        (u) => u.username == savedUsername,
        orElse: () => throw Exception('User not found'),
      );

      currentUser.value = user;

      log('Current user loaded: id=${user.id}, username=${user.username}');
    } catch (e) {
      error.value = e.toString();
      log('Error fetching current user: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // =================== Language ===================
  Future<void> changeLanguage(String langCode, BuildContext context) async {
    try {
      final newLocale = Locale(langCode);
      isTranslate.value = langCode == 'ar';

      await EasyLocalization.of(context)?.setLocale(newLocale);
      Get.updateLocale(newLocale);

      final storage = GetStorage();
      storage.write('languageCode', langCode);
    } catch (e) {
      log('Error changing language: $e');
    }
  }

  // =================== Auth ===================
  void logOut() {
    appBuilder.logout();
    Get.offNamedUntil(Pages.login.value, (route) => false);
  }
}
