import 'package:get/get.dart';
import 'package:shop/features/profile/controller.dart';

class MainPageController extends GetxController {
  Rx<int> currentPage = 0.obs;
  final controllerProfile = Get.put(ProfilePageController());
  

}
