import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/login_api_controller.dart';

class ProfileController extends GetxController {
  final loginapiController = Get.find<LoginApiController>();

  void logout() {
    loginapiController.loginApi();
  }
}
