import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/example_controller.dart';

class ExampleBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController(),);
  }
}