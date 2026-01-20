import 'package:get/get.dart';
//import 'package:get/get_instance/get_instance.dart';
import 'package:flutter_gandum/controllers/splashscreen_controller.dart';


class SplashscreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashscreenController>(()=>SplashscreenController());
  }
}