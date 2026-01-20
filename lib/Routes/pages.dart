//import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gandum/Login_Page.dart';
import 'package:flutter_gandum/Routes/routes.dart';
import 'package:flutter_gandum/bindings/calculator_binding.dart';
import 'package:flutter_gandum/bindings/contact_binding.dart';
import 'package:flutter_gandum/bindings/login_binding.dart';
import 'package:flutter_gandum/bindings/splashscreen_binding.dart';
import 'package:flutter_gandum/pages/HomePage.dart';
import 'package:flutter_gandum/pages/calculator_page.dart';
import 'package:flutter_gandum/pages/contact_page.dart';
import 'package:flutter_gandum/pages/football_add_pages.dart';
import 'package:flutter_gandum/pages/football_edit_pages.dart';
import 'package:flutter_gandum/pages/football_pages.dart';
import 'package:flutter_gandum/pages/login_page.dart';
import 'package:flutter_gandum/pages/profile_page.dart';
import 'package:flutter_gandum/pages/splashscreen_page.dart';

class AppPages{
  //list atau array yang isinya kumpulan page kita
  static final pages = [
    GetPage(name: AppRoutes.mainmenu, page: ()=> HomePage()),
    GetPage(
      name: AppRoutes.calculator, 
      page: ()=> CalculatorPage(),
      binding: CalculatorBinding(),
      ),
    GetPage(
      name: AppRoutes.footballplayers, 
      page: ()=> FootballPages(),
      binding: CalculatorBinding(),
      ),
    GetPage(
      name: AppRoutes.footballeditplayers, 
      page: ()=> FootballEditPages(),
      binding: CalculatorBinding(),
      ),
    GetPage(name: AppRoutes.footballaddplayers, page: ()=> FootballAddPages()),
    GetPage(name: AppRoutes.profile, page: ()=> ProfilePage(), binding: LoginBinding()),

    //tambah routes page baru
    GetPage(name: AppRoutes.splashScreen, page: ()=> SplashscreenPage(), binding: SplashscreenBinding()),
    GetPage(name: AppRoutes.login, page: ()=> LoginPages(), binding: LoginBinding()),
    GetPage(name: AppRoutes.contact, page: ()=> ContactPage(), binding: ContactBinding()),
  ];
}