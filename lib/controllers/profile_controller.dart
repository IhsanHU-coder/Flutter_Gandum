import 'package:get/get.dart';
import 'package:project_dart_1/controllers/login_api_controller.dart';

class ProfileController extends GetxController {
  final loginapiController = Get.find<LoginApiController>();

  void logout() {
    loginapiController.loginApi();
  }
}
