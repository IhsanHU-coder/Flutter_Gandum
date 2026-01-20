import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gandum/Routes/routes.dart';
import 'package:flutter_gandum/controllers/calculator_controller.dart';
import 'package:flutter_gandum/widgets/widget_button.dart';
import 'package:flutter_gandum/widgets/widget_textfield.dart';

class CalculatorPage extends StatelessWidget {


  CalculatorPage({super.key});
  
    //final CalculatorController calculatorController = Get.put(CalculatorController());
    final CalculatorController calculatorController =
  Get.isRegistered<CalculatorController>()
    ? Get.find<CalculatorController>()
    : Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Calculator"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomField(textEditingController: calculatorController.txtAngka1, labelText: "Input Angka 1", obscureText: false, hintText: "Input Angka 1"),
          CustomField(textEditingController: calculatorController.txtAngka2, labelText: "Input Angka 2", obscureText: false, hintText: "Input Angka 2"),
          // CustomField(textEditingController: calcu, labelText: labelText, obscureText: obscureText, hintText: hintText)
          Container(
            
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(text: "+", textColour: Colors.blue, onPressed: (){
                  calculatorController.tambah();
                },),

                CustomButton(text: "-", textColour: Colors.blue, onPressed: (){
                  calculatorController.kurang();
                },),
              ],
            ),
          ),
          
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(text: "*", textColour: Colors.blue, onPressed: (){
                  calculatorController.kali();
                },),

                CustomButton(text: "/", textColour: Colors.blue, onPressed: (){
                  calculatorController.bagi();
                },),
              ],
            ),
          ),
          Obx(() => Text("Hasil " + calculatorController.hasil.value)),
          //CustomField(textEditingController: null, labelText: "Hasil", obscureText: false, hintText: "hasil"),
          CustomButton(text: "CLear", textColour: Colors.red, onPressed: (){
              //CustomField(textEditingController: txtAngka1 labelText: labelText, obscureText: obscureText, hintText: hintText)
              calculatorController.txtAngka1.text = "";
              calculatorController.txtAngka2.text = "";
              
                },),

          CustomButton(text: "Move to footballplayers", textColour: Colors.green, onPressed: (){
            Get.toNamed(AppRoutes.footballplayers);
          }),

        ],
      ),
    );
  }
}