import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gandum/controllers/login_controller.dart';
import 'package:flutter_gandum/widgets/widget_button.dart';
import 'package:flutter_gandum/widgets/widget_textfield.dart';

class LoginPages extends StatelessWidget {
  LoginPages({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        child: Column(
          children: [
            CustomField(textEditingController: controller.usernameController, labelText: "username", obscureText: false, hintText: "username"),
            CustomField(textEditingController: controller.passwordController, labelText: "password", obscureText: true, hintText: "password"),
            CustomButton(text: "Login", textColour: Colors.black, onPressed: (){
              controller.login();
            })
            
            
          ],
        ),
      ),
    );
  }
}