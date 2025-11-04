import 'package:get/get.dart';
import 'package:project_dart_1/controllers/premiere_table_controller.dart';

class PremiereBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PremiereTableController>(()=>PremiereTableController());
  }

}