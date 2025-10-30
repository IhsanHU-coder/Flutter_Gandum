import 'package:get/get.dart';
import 'package:project_dart_1/controllers/btn_nav_controller.dart';
import 'package:project_dart_1/controllers/calculator_controller.dart';
import 'package:project_dart_1/controllers/contact_controller.dart';
import 'package:project_dart_1/controllers/football_controller.dart';
import 'package:project_dart_1/controllers/profile_controller.dart';
import 'package:project_dart_1/controllers/login_controller.dart';
import 'package:project_dart_1/controllers/example_controller.dart';
import 'package:project_dart_1/controllers/example_footballplayer_controller.dart';

class BottomNavPageBinding extends Bindings {
  @override
  void dependencies() {
    //Get.put<BtnNavController>(BtnNavController());
    Get.lazyPut<BtnNavController>(()=>BtnNavController());

    // Semua controller yang dipakai di bawah BtnNavPage
    Get.lazyPut<CalculatorController>(() => CalculatorController());
    Get.lazyPut<FootballController>(() => FootballController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);

    // Tambahkan ini 👇
    Get.lazyPut<ExampleController>(() => ExampleController());
    Get.lazyPut<ExampleFootballplayerController>(() => ExampleFootballplayerController());
  }
}
