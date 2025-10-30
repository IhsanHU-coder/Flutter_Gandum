import 'package:get/get.dart';
import 'package:project_dart_1/controllers/calculator_controller.dart';
import 'package:project_dart_1/controllers/football_controller.dart';
import 'package:project_dart_1/controllers/football_edit_controller.dart';

class CalculatorBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<CalculatorController>(()=>CalculatorController());
    Get.lazyPut<FootballController>(()=>FootballController());
    Get.lazyPut<FootballEditController>(()=>FootballEditController());
  }}