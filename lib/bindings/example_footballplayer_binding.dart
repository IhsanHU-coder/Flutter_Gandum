import 'package:get/get.dart';
import 'package:project_dart_1/controllers/example_footballplayer_controller.dart';

class ExampleFootballplayerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExampleFootballplayerController>(()=>ExampleFootballplayerController());
  }
}