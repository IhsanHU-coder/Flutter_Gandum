import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_dart_1/controllers/example_controller.dart';
import 'package:project_dart_1/pages/Mobile/example_mobile.dart';
import 'package:project_dart_1/pages/Widescreen/example_widescreen.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  final ExampleController controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains){
          controller.updateLayout(constrains);
        return Obx(()=> controller.isMobile.value
         ? ExampleMobile()
         : ExampleWidescreen());
      }),
    );
  }
}