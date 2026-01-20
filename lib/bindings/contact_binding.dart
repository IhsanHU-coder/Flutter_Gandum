import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/contact_controller.dart';

class ContactBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(()=>ContactController());
  }
}