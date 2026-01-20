import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginController>(()=>LoginController());
  }

}