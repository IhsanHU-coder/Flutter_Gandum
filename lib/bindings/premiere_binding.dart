import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/premiere_table_controller.dart';

class PremiereBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PremiereTableController>(()=>PremiereTableController());
  }

}