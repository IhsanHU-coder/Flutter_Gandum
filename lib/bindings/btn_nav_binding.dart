import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/btn_nav_controller.dart';
import 'package:flutter_gandum/controllers/calculator_controller.dart';
import 'package:flutter_gandum/controllers/contact_controller.dart';
import 'package:flutter_gandum/controllers/football_controller.dart';
import 'package:flutter_gandum/controllers/football_edit_controller.dart';
import 'package:flutter_gandum/controllers/login_api_controller.dart';
import 'package:flutter_gandum/controllers/premiere_table_controller.dart';
import 'package:flutter_gandum/controllers/profile_controller.dart';
import 'package:flutter_gandum/controllers/login_controller.dart';
import 'package:flutter_gandum/controllers/example_controller.dart';
import 'package:flutter_gandum/controllers/example_footballplayer_controller.dart';

class BottomNavPageBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put<BtnNavController>(BtnNavController());
    Get.lazyPut<BtnNavController>(()=>BtnNavController());
    Get.lazyPut<LoginApiController>(()=>LoginApiController());
    Get.lazyPut<PremiereTableController>(()=>PremiereTableController());


    // Semua controller yang dipakai di bawah BtnNavPage
    Get.lazyPut<CalculatorController>(() => CalculatorController());
    Get.lazyPut<FootballController>(() => FootballController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<ExampleFootballplayerController>(()=>ExampleFootballplayerController());
    Get.lazyPut<FootballEditController>(()=>FootballEditController());

    // Tambahkan ini 👇
    Get.lazyPut<ExampleController>(() => ExampleController());
    Get.lazyPut<ExampleFootballplayerController>(() => ExampleFootballplayerController());
  }
}
