import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/btn_nav_controller.dart';

class MainmenuBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BtnNavController>(()=>BtnNavController());
  }

}