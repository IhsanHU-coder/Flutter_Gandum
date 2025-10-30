import 'package:get/get.dart';
import 'package:project_dart_1/controllers/example_controller.dart';

class ExampleBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController(),);
  }
}