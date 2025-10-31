import 'package:get/get.dart';
import 'package:project_dart_1/Routes/routes.dart';
import 'package:project_dart_1/bindings/btn_nav_binding.dart';
import 'package:project_dart_1/bindings/splashscreen_binding.dart';
import 'package:project_dart_1/pages/btn_nav_page.dart';
import 'package:project_dart_1/pages/login_api_page.dart';
import 'package:project_dart_1/pages/calculator_page.dart';
import 'package:project_dart_1/pages/notification_page.dart';
import 'package:project_dart_1/pages/profile2_page.dart';
import 'package:project_dart_1/pages/profile_page.dart';
import 'package:project_dart_1/pages/contact_page.dart';
import 'package:project_dart_1/pages/example_page.dart';
import 'package:project_dart_1/pages/example_footballplayer_page.dart';
import 'package:project_dart_1/bindings/login_api_binding.dart';
import 'package:project_dart_1/bindings/mainmenu_binding.dart';
import 'package:project_dart_1/bindings/calculator_binding.dart';
import 'package:project_dart_1/bindings/contact_binding.dart';
import 'package:project_dart_1/bindings/profile_binding.dart';
import 'package:project_dart_1/bindings/example_binding.dart';
import 'package:project_dart_1/bindings/example_footballplayer_binding.dart';
import 'package:project_dart_1/pages/splashscreen_page.dart';

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
  ];
}
