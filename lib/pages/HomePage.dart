import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/calculator_controller.dart';
import 'package:flutter_gandum/controllers/contact_controller.dart';
import 'package:flutter_gandum/controllers/football_controller.dart';
import 'package:flutter_gandum/controllers/home_controller.dart';
import 'package:flutter_gandum/controllers/login_controller.dart';
import 'package:flutter_gandum/pages/calculator_page.dart';
import 'package:flutter_gandum/pages/contact_page.dart';
import 'package:flutter_gandum/pages/football_pages.dart';
import 'package:flutter_gandum/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  final pages = [
    CalculatorPage(),
    FootballPages(),
    ProfilePage(),
    ContactPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text("My App"),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.calculate),
                  title: const Text("Calculator"),
                  onTap: () {
                    Get.lazyPut<CalculatorController>(() => CalculatorController()); // inject dulu
                    Get.to(() => CalculatorPage());
                    // controller.changeTab(0);
                    // Navigator.pop(context); // close drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.sports_soccer),
                  title: const Text("Football"),
                  onTap: () {
                    Get.lazyPut<FootballController>(() => FootballController()); // inject dulu
                    Get.to(() => FootballPages());
                    // controller.changeTab(1);
                    // Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    Get.lazyPut<LoginController>(() => LoginController()); // inject dulu
                    Get.to(() => ProfilePage());
                    // controller.changeTab(2);
                    // Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Contact"),
                  onTap: () {
                    Get.lazyPut<ContactController>(() => ContactController());
                    Get.to(() => const ContactPage());
                    // controller.changeTab(3);
                    // Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: pages[controller.currentIndex.value],
        ));
  }
}
