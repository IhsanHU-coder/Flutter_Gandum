import 'package:get/get.dart';
import 'package:project_dart_1/controllers/login_api_controller.dart';

class LoginApiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(()=>LoginApiController());
  }
}