import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_dart_1/controllers/login_api_controller.dart';

class ProfileGooglePage extends StatefulWidget {
  const ProfileGooglePage({super.key});

  @override
  State<ProfileGooglePage> createState() => _ProfileGooglePageState();
}

class _ProfileGooglePageState extends State<ProfileGooglePage> {
  final LoginApiController controller = Get.find<LoginApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Google')),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🔹 Foto profil Google
                CircleAvatar(
                  radius: 60,
                  backgroundImage: controller.googlePhoto.value.isNotEmpty
                      ? NetworkImage(controller.googlePhoto.value)
                      : const AssetImage('assets/images/default_avatar.png')
                          as ImageProvider,
                ),
                const SizedBox(height: 20),

                // 🔹 Nama Google
                Text(
                  controller.googleName.value.isNotEmpty
                      ? controller.googleName.value
                      : 'Nama tidak tersedia',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // 🔹 Email Google
                Text(
                  controller.googleEmail.value.isNotEmpty
                      ? controller.googleEmail.value
                      : 'Email tidak tersedia',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                // 🔘 Tombol Logout
                ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout Google"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    controller.logoutGoogle();
                    Get.back(); // kembali ke halaman login
                  },
                ),
              ],
            )),
      ),
    );
  }
}
