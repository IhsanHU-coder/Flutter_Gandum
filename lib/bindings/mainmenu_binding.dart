import 'package:get/get.dart';
import 'package:project_dart_1/controllers/btn_nav_controller.dart';

class MainmenuBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BtnNavController>(()=>BtnNavController());
  }

}