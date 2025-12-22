import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/core/config/role.dart';

import '../routes/routes.dart';
import '../services/rest_api/rest_api.dart';

class AppBuilder extends GetxService {
  GetStorage box = GetStorage("app");

  late Role role;
  // GeneralUser? user;
  String? token;

  loadData() async {
    await box.initStorage;

    if (!box.hasData("role")) {
      setRole(Role.new_user);
    } else {
      role = Role.fromString(box.read("role"));
    }

    if (box.hasData("token")) {
      token = box.read("token");
    }
  }

  setRole(Role role) {
    this.role = role;
    box.write("role", role.name);
  }

  // setUserData(GeneralUser user){}

  setToken(String? token) {
    this.token = token;
    if (token != null) {
      box.write("token", token);
    } else {
      box.remove("token");
    }
  }

  logout() {
    setRole(Role.unregistered);
    setToken(null);
    Get.find<APIService>().setToken(null);
     box.remove("username");
    box.remove("user_id");
    
  }

  init() async {
    await loadData();

    Get.put(APIService(token: token));

    if (role == Role.unregistered || role == Role.new_user) {
      Get.toNamed(Pages.login.value);
    } else {
      Get.offAllNamed(Pages.home.value);
    }
  }
}
