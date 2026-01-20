import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/btn_nav_controller.dart';
import 'package:flutter_gandum/controllers/login_api_controller.dart';

class LoginApiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(()=>LoginApiController());
    Get.put(BtnNavController());
  }
}