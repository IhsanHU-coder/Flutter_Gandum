import 'package:get/get.dart';
import 'package:flutter_gandum/Routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //cek if username is stored
    checkLogin();
  }

  void checkLogin()async{
    await Future.delayed(Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString("username");
    if(savedUsername != null){
      Get.offAllNamed(AppRoutes.mainmenu);
    }else{
      Get.offAllNamed(AppRoutes.login);
    }
  }

  
}