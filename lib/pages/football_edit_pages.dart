import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_dart_1/controllers/football_edit_controller.dart';

class FootballEditPages extends StatelessWidget {
  const FootballEditPages({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(FootballEditController());
    final controller = Get.find<FootballEditController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isEdit ? "Edit Player" : "Add Player"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.imageController,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: "Player Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.numberController,
              decoration: const InputDecoration(labelText: "Number"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.savePlayer,
              child: Text(controller.isEdit ? "Update Player" : "Add Player"),
            ),
          ],
        ),
      ),
    );
  }
}
