import 'package:get/get.dart';
//import 'package:get/get_instance/get_instance.dart';
import 'package:project_dart_1/controllers/splashscreen_controller.dart';


class SplashscreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(()=>SplashscreenController());
  }
}