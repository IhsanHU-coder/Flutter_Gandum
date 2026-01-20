import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/football_controller.dart';
import 'package:flutter_gandum/models/football_model.dart';

class FootballEditController extends GetxController {
  FootballController footballController = Get.find<FootballController>();

  int? index;
  late TextEditingController imageController;
  late TextEditingController nameController;
  late TextEditingController numberController;

  bool get isEdit => index != null;

  @override
  void onInit() {
    super.onInit();
    index = Get.arguments;

    if (isEdit) {
      final player = footballController.players[index!];
      imageController = TextEditingController(text: player.image);
      nameController = TextEditingController(text: player.namaOrang);
      numberController = TextEditingController(text: player.nomor);
    } else {
      imageController = TextEditingController();
      nameController = TextEditingController();
      numberController = TextEditingController();
    }
  }

  @override
  void onClose() {
    imageController.dispose();
    nameController.dispose();
    numberController.dispose();
    super.onClose();
  }

  void savePlayer() {
    if (isEdit) {
      footballController.players[index!] = FootballPlayer(
        image: imageController.text,
        namaOrang: nameController.text,
        nomor: numberController.text,
      );
    } else {
      footballController.players.add(FootballPlayer(
        image: imageController.text,
        namaOrang: nameController.text,
        nomor: numberController.text,
      ));
    }
    Get.back();
  }
}
