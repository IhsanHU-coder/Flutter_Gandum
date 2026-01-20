import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/football_controller.dart';
import 'package:flutter_gandum/models/football_model.dart';

class FootballAddPages extends StatelessWidget {
  final int? index; // null kalau tambah baru
  final footballController = Get.find<FootballController>();

  // Constructor untuk menerima index
  FootballAddPages({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    // kalau edit, ambil data lama
    final isEdit = index != null;
    final player = isEdit ? footballController.players[index!] : null;

    // Controller untuk input
    final imageController = TextEditingController(text: player?.image ?? '');
    final nameController = TextEditingController(text: player?.namaOrang ?? '');
    final numberController = TextEditingController(text: player?.nomor ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Player" : "Add Player"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: "Image URL"),
            ),
            SizedBox(height: 12),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Player Name"),
            ),
            SizedBox(height: 12),
            TextField(
              controller: numberController,
              decoration: InputDecoration(labelText: "Number"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isEdit) {
                  // update data pemain
                  footballController.players[index!] = FootballPlayer(
                    image: imageController.text,
                    namaOrang: nameController.text,
                    nomor: numberController.text,
                  );
                } else {
                  // tambah data pemain
                  footballController.players.add(FootballPlayer(
                    image: imageController.text,
                    namaOrang: nameController.text,
                    nomor: numberController.text,
                  ));
                }

                Get.back(); // kembali ke halaman sebelumnya
              },
              child: Text(isEdit ? "Update Player" : "Add Player"),
            ),
          ],
        ),
      ),
    );
  }
}