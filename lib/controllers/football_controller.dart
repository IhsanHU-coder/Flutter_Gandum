import 'package:get/get.dart';
import 'package:flutter_gandum/models/football_model.dart';

class FootballController extends GetxController {
  var players = <FootballPlayer>[
    FootballPlayer(
      image: 'https://imageio.forbes.com/specials-images/imageserve/663e595b4509f97fdafb95f5/0x0.jpg?format=jpg&crop=383,383,x1045,y23,safe&height=416&width=416&fit=bounds',
      namaOrang: 'Lionel Messi',
      nomor: '10',
    ),
    FootballPlayer(
      image: 'https://hips.hearstapps.com/hmg-prod/images/cristiano-ronaldo-of-portugal-during-the-uefa-nations-news-photo-1748359673.pjpeg?crop=0.610xw:0.917xh;0.317xw,0.0829xh&resize=640:*',
      namaOrang: 'Cristiano Ronaldo',
      nomor: '7',
    ),
    FootballPlayer(
      image: 'https://imageio.forbes.com/specials-images/imageserve/626c7cf3616c1112ae834a2b/0x0.jpg?format=jpg&crop=1603,1603,x1533,y577,safe&height=416&width=416&fit=bounds',
      namaOrang: 'Kylian Mbappé',
      nomor: '7',
    ),
  ].obs;
  
}
