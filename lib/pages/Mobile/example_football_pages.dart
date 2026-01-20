import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter_gandum/Routes/routes.dart';
import 'package:flutter_gandum/controllers/example_footballplayer_controller.dart';

class ExampleFootballPages extends StatelessWidget {
  ExampleFootballPages({super.key});

  final ExampleFootballplayerController footballController = Get.put(ExampleFootballplayerController());
  //final footballController = Get.find<FootballController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My FootBall Players Mobile"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(
          
          ()=> ListView.builder(
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              final player = footballController.players[index];
              return ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(player.image),
                ),
                title: Text(player.namaOrang),
                subtitle: Text('No. ${player.nomor}'),
                onTap: () {
                  //Get.toNamed(AppRoutes.footballeditplayers);
                  //Get.to(() => FootballEditPages(index: index));
                  Get.toNamed(
                    AppRoutes.footballeditplayers, // route yg kamu definisikan di routes.dart
                    arguments: index,
                  );
                  Get.snackbar(
                    "Edit Player",
                    "Editing ${player.namaOrang} - No. ${player.nomor}",
                    
                  );

                  
                  
                },
                
            // onTap: (){
            //   Get.snackbar("Clicked", footballController.players[index]);
            // },
            // title: Text(footballController.players[index]),
            );
            
        },)
        
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add player
          Get.toNamed(AppRoutes.footballaddplayers);
        },
        child: Icon(Icons.add),
      ),
    );
    
  }
}