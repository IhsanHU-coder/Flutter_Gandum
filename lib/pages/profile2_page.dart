import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_dart_1/controllers/login_controller.dart';
import 'package:project_dart_1/controllers/splashscreen_controller.dart';
import 'package:project_dart_1/widgets/widget_button.dart';

class Profile2Page extends StatelessWidget {
  Profile2Page({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Foto profil (ganti assetnya sesuai punyamu)
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://yt3.googleusercontent.com/ytc/AIdro_nugqGzCgoJ4yJH_GvzHthV66mx3quWJ8niMGBF03wOcA=s160-c-k-c0x00ffffff-no-rj",
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Ihsan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Absen: 17",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            CustomButton(text: "Logout", textColour: Colors.red, onPressed: (){
              controller.logout();
            })
          ],
        ),
      ),
    );
  }
}