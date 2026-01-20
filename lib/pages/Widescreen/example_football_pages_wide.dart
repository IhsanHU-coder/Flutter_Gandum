import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gandum/Routes/routes.dart';
import 'package:flutter_gandum/controllers/example_footballplayer_controller.dart';

class ExampleFootballPagesWide extends StatelessWidget {
  ExampleFootballPagesWide({super.key});

  final ExampleFootballplayerController footballController = Get.put(ExampleFootballplayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Football Players Widescreen"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 kolom
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              childAspectRatio: 1.7, // 🔹 Ukuran kartu dibuat lebih ramping
            ),
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              final player = footballController.players[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.footballeditplayers,
                    arguments: index,
                  );
                  Get.snackbar(
                    "Edit Player",
                    "Editing ${player.namaOrang} - No. ${player.nomor}",
                  );
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(player.image),
                          radius: 35, // 🔹 Lebih kecil dari sebelumnya
                        ),
                        const SizedBox(height: 8),
                        Text(
                          player.namaOrang,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'No. ${player.nomor}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.footballaddplayers);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
