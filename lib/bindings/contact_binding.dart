import 'package:get/get.dart';
import 'package:project_dart_1/controllers/contact_controller.dart';

class ContactBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(()=>ContactController());
  }
}