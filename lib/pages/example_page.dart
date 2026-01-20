import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/example_controller.dart';
import 'package:flutter_gandum/pages/Mobile/example_mobile.dart';
import 'package:flutter_gandum/pages/Widescreen/example_widescreen.dart';

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