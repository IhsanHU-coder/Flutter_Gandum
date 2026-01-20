import 'package:get/get.dart';
import 'package:flutter_gandum/Routes/routes.dart';
import 'package:flutter_gandum/bindings/btn_nav_binding.dart';
import 'package:flutter_gandum/bindings/premiere_binding.dart';
import 'package:flutter_gandum/bindings/splashscreen_binding.dart';
import 'package:flutter_gandum/pages/btn_nav_page.dart';
import 'package:flutter_gandum/pages/football_add_pages.dart';
import 'package:flutter_gandum/pages/football_edit_pages.dart';
import 'package:flutter_gandum/pages/login_api_page.dart';
import 'package:flutter_gandum/pages/calculator_page.dart';
import 'package:flutter_gandum/pages/notification_page.dart';
import 'package:flutter_gandum/pages/premiere_table_page.dart';
import 'package:flutter_gandum/pages/profile2_page.dart';
import 'package:flutter_gandum/pages/profile_google_page.dart';
import 'package:flutter_gandum/pages/profile_page.dart';
import 'package:flutter_gandum/pages/contact_page.dart';
import 'package:flutter_gandum/pages/example_page.dart';
import 'package:flutter_gandum/pages/example_footballplayer_page.dart';
import 'package:flutter_gandum/bindings/login_api_binding.dart';
import 'package:flutter_gandum/bindings/mainmenu_binding.dart';
import 'package:flutter_gandum/bindings/calculator_binding.dart';
import 'package:flutter_gandum/bindings/contact_binding.dart';
import 'package:flutter_gandum/bindings/profile_binding.dart';
import 'package:flutter_gandum/bindings/example_binding.dart';
import 'package:flutter_gandum/bindings/example_footballplayer_binding.dart';
import 'package:flutter_gandum/pages/splashscreen_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.loginapi,
      page: () => LoginApiPage(),
      binding: LoginApiBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.mainmenu,
    //   page: () => HomePage(),
    //   binding: MainmenuBinding(),
    // ),
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: AppRoutes.contact,
      page: () => ContactPage(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.profile2,
      page: () => Profile2Page(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.examplescreen,
      page: () => ExamplePage(),
      binding: ExampleBinding(),
    ),
    GetPage(
      name: AppRoutes.examplefootballplayers,
      page: () => ExampleFootballplayerPage(),
      binding: ExampleFootballplayerBinding(),
    ),
    GetPage(
      name: AppRoutes.btnNav,
      page: () => BtnNavPage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => NotificationPage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.premiereTable,
      page: () => PremiereTablePage(),
      binding: PremiereBinding(),
    ),
    GetPage(
      name: AppRoutes.footballaddplayers,
      page: () => FootballAddPages(),
      binding: ExampleFootballplayerBinding(),
    ),
    GetPage(
      name: AppRoutes.footballeditplayers,
      page: () => FootballEditPages(),
      binding: ExampleFootballplayerBinding(),
    ),
    GetPage(
      name: AppRoutes.profileGoogle,
      page: () => ProfileGooglePage(),
      binding: BottomNavPageBinding(),
    ),
  ];
}
