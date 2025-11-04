import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_dart_1/controllers/btn_nav_controller.dart';
import 'package:project_dart_1/controllers/login_api_controller.dart';
import 'package:project_dart_1/pages/calculator_page.dart';
import 'package:project_dart_1/pages/contact_page.dart';
import 'package:project_dart_1/pages/football_pages.dart';
import 'package:project_dart_1/pages/notification_page.dart';
import 'package:project_dart_1/pages/premiere_table_page.dart';
import 'package:project_dart_1/pages/profile2_page.dart';
import 'package:project_dart_1/pages/example_page.dart';
import 'package:project_dart_1/pages/profile_google_page.dart';

class BtnNavPage extends StatelessWidget {
  BtnNavPage({super.key});

  final BtnNavController controller = Get.find<BtnNavController>();
  final LoginApiController loginapicontroller = Get.find<LoginApiController>();

  final List<Widget> pages = [
    CalculatorPage(),
    ContactPage(),
    Profile2Page(),
    ExamplePage(),
    FootballPages(),
    NotificationPage(),
    PremiereTablePage(),
    ProfileGooglePage(),
  ];

  @override
  Widget build(BuildContext context) {
    print("btnNav Dibuka");
    return Obx(() => Scaffold(
      
          appBar: AppBar(
            title: const Text("My App"),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.calculate),
                  title: const Text("Calculator"),
                  onTap: () {
                    controller.changeTab(0);
                    Get.back(); // tutup drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_page),
                  title: const Text("Contact"),
                  onTap: () {
                    controller.changeTab(1);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    controller.changeTab(2);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text("Example"),
                  onTap: () {
                    controller.changeTab(3);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text("Football Page"),
                  onTap: () {
                    controller.changeTab(4);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text("Notification Page"),
                  onTap: () {
                    controller.changeTab(5);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text("Premiere League Page"),
                  onTap: () {
                    controller.changeTab(6);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile Google Page"),
                  onTap: () {
                    controller.changeTab(7);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    loginapicontroller.logoutGoogle();
                  },
                ),
              ],
            ),
          ),

          // 🧠 INI BAGIAN REAKTIF
          body: pages[controller.currentIndex.value],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: "Calculator",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_page),
                label: "Contact",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "Example",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Football Page",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Notification Page",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_emergency),
                label: "Premiere League Page",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile Google Page",
              ),
            ],
          ),
        ));
  }
}
