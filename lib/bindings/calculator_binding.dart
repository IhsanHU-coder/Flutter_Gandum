import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/calculator_controller.dart';
import 'package:flutter_gandum/controllers/football_controller.dart';
import 'package:flutter_gandum/controllers/football_edit_controller.dart';

class CalculatorBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    //Get.put(CalculatorController());
    Get.lazyPut<CalculatorController>(()=>CalculatorController());
    Get.lazyPut<FootballController>(()=>FootballController());
    Get.lazyPut<FootballEditController>(()=>FootballEditController());
  }}