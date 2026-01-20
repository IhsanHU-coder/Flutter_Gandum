import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/example_footballplayer_controller.dart';

class ExampleFootballplayerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExampleFootballplayerController>(()=>ExampleFootballplayerController());
  }
}