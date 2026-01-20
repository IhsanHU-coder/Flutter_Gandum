import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gandum/API/login_api_api.dart';
import 'package:flutter_gandum/Routes/routes.dart';
import 'package:flutter_gandum/models/login_api_model.dart';
import 'package:flutter_gandum/pages/btn_nav_page.dart';
import 'package:flutter_gandum/pages/login_api_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginApiController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

  var googleName = "".obs;
  var googleEmail = "".obs;
  var googlePhoto = "".obs;


  var isLoading = false.obs;

  // @override
  // void onClose() {
  //   usernameController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }
  @override
  void onInit() {
    super.onInit();
    loadGoogleData();
  }

  Future<void> loadGoogleData() async {
    final prefs = await SharedPreferences.getInstance();

    googleName.value = prefs.getString("google_name") ?? "";
    googleEmail.value = prefs.getString("google_email") ?? "";
    googlePhoto.value = prefs.getString("google_photo") ?? "";
  }

  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // ✅ Setelah login sukses
      final prefs = await SharedPreferences.getInstance();

      googleName.value = googleUser.displayName ?? "";
      googleEmail.value = googleUser.email;
      googlePhoto.value = googleUser.photoUrl ?? "";

      await prefs.setString("google_name", googleName.value);
      await prefs.setString("google_email", googleEmail.value);
      await prefs.setString("google_photo", googlePhoto.value);
      await prefs.setBool("google_logged_in", true);

      Get.snackbar("Success", "Login Google sukses!");
      Get.offAllNamed(AppRoutes.btnNav);
    } catch (e) {
      print("Google Sign-In Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }



 



  void loginApi() async {
    print('\n========================================');
    print('🚀 LOGIN API STARTED');
    print('========================================');
    
    // Validasi input
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      print('❌ Validation Failed: Username atau password kosong');
      Get.snackbar(
        "ERROR",
        "Username dan password tidak boleh kosong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(63, 112, 111, 111),
        colorText: Colors.black,
      );
      return;
    }
    

    print('✅ Validation Passed');
    print('📝 Username: ${usernameController.text}');
    print('📝 Password: ${passwordController.text}');
    
    isLoading.value = true;

    try {
      // Prepare request data
      final requestData = {
        'username': usernameController.text,
        'password': passwordController.text,
      };

      print('\n----------------------------------------');
      print('📤 REQUEST DETAILS:');
      print('----------------------------------------');
      print('URL: ${ClientNetwork.login}');
      print('Method: POST');
      print('Body Parameters:');
      requestData.forEach((key, value) {
        print('  - $key: $value');
      });
      print('----------------------------------------\n');

      // Hit API
      print('⏳ Sending request to server...');
      final response = await http.post(
        Uri.parse(ClientNetwork.login),
        body: requestData,
      );

      print('\n----------------------------------------');
      print('📥 RESPONSE DETAILS:');
      print('----------------------------------------');
      print('Status Code: ${response.statusCode}');
      print('Status Message: ${response.reasonPhrase}');
      print('Response Headers: ${response.headers}');
      print('Response Body: ${response.body}');
      print('Response Length: ${response.body.length} characters');
      print('----------------------------------------\n');

      // Parse response
      if (response.statusCode == 200) {
        print('✅ Status Code 200 - OK');
        
        try {
          final LoginModel loginModel = loginModelFromJson(response.body);
          
          print('\n----------------------------------------');
          print('📦 PARSED MODEL:');
          print('----------------------------------------');
          print('Status: ${loginModel.status}');
          print('Message: ${loginModel.message}');
          print('Token: ${loginModel.token}');
          print('Token Length: ${loginModel.token.length} characters');
          print('----------------------------------------\n');

          if (loginModel.status) {
            print('✅ Login Status: SUCCESS');
            
            // Simpan token ke SharedPreferences
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString("username", usernameController.text);

            await prefs.setString('token', loginModel.token);
            await prefs.setString('username', usernameController.text);

            print('💾 Token saved to SharedPreferences');
            print('💾 Username saved to SharedPreferences');

            isLoading.value = false;
            
            print('🔄 Navigating to: ${AppRoutes.btnNav}');
            print('========================================');
            print('✅ LOGIN API COMPLETED SUCCESSFULLY');
            print('========================================\n');
            
            // Navigate ke halaman utama
            Get.offAllNamed(AppRoutes.btnNav);

            Get.snackbar(
              "BERHASIL",
              loginModel.message,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green[100],
              colorText: Colors.black,
            );

            
            await Future.delayed(const Duration(milliseconds: 5000));
          } else {
            print('❌ Login Status: FAILED');
            print('📝 Reason: ${loginModel.message}');
            
            isLoading.value = false;
            Get.snackbar(
              "ERROR",
              loginModel.message,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red[100],
              colorText: Colors.black,
            );
            
            print('========================================');
            print('❌ LOGIN API FAILED');
            print('========================================\n');
          }
        } catch (parseError) {
          isLoading.value = false;
          print('\n❌ JSON PARSE ERROR:');
          print('Error: ${parseError.toString()}');
          print('Raw Response: ${response.body}');
          
          Get.snackbar(
            "ERROR",
            "Error parsing response: ${parseError.toString()}",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[100],
            colorText: Colors.black,
          );
          
          print('========================================');
          print('❌ LOGIN API FAILED - PARSE ERROR');
          print('========================================\n');
        }
      } else {
        print('❌ Status Code: ${response.statusCode} - ${response.reasonPhrase}');
        isLoading.value = false;
        
        Get.snackbar(
          "ERROR",
          "Server error: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
          colorText: Colors.black,
        );
        
        print('========================================');
        print('❌ LOGIN API FAILED - SERVER ERROR');
        print('========================================\n');
      }
    } catch (e) {
      isLoading.value = false;
      
      print('\n❌❌❌ EXCEPTION OCCURRED ❌❌❌');
      print('Error Type: ${e.runtimeType}');
      print('Error Message: ${e.toString()}');
      print('Stack Trace:');
      print(StackTrace.current);
      
      Get.snackbar(
        "ERROR",
        "Terjadi kesalahan: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
      
      print('========================================');
      print('❌ LOGIN API FAILED - EXCEPTION');
      print('========================================\n');
    }   

  }

  void logout() async {
    print('\n========================================');
  print('🚪 LOGOUT API STARTED');
  print('========================================');

  try {
    final prefs = await SharedPreferences.getInstance();

    // Hapus data login biasa
    await prefs.remove("username");
    await prefs.remove("token");

    usernameController.clear();
    passwordController.clear();

    print('🧹 SharedPreferences cleared');
    print('✅ API Logout successful');

    // Kembali ke halaman login
    Get.offAllNamed(AppRoutes.loginapi);
    Get.snackbar(
      "LOGOUT",
      "Logout akun berhasil",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange[100],
      colorText: Colors.black,
    );

    print('========================================');
    print('✅ LOGOUT API COMPLETED');
    print('========================================\n');
  } catch (e) {
    print('❌ API Logout Error: $e');
    Get.snackbar(
      "ERROR",
      "Gagal logout API: ${e.toString()}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red[100],
      colorText: Colors.black,
    );
  }
  }

  Future<void> logoutGoogle() async {
  print('\n========================================');
  print('🚪 LOGOUT GOOGLE STARTED');
  print('========================================');

  try {
    // Keluar dari Google Sign-In dan Firebase
    await _googleSignIn.signOut();
    await auth.signOut();

    // Hapus data Google dari SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("google_name");
    await prefs.remove("google_email");
    await prefs.remove("google_photo");
    await prefs.remove("google_logged_in");

    // Reset observable
    googleName.value = "";
    googleEmail.value = "";
    googlePhoto.value = "";

    print('✅ Google Sign-Out success & SharedPreferences cleared');

    // Kembali ke halaman login
    Get.offAllNamed(AppRoutes.loginapi);
    Get.snackbar(
      "LOGOUT",
      "Logout Google berhasil",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange[100],
      colorText: Colors.black,
    );

    print('========================================');
    print('✅ LOGOUT GOOGLE COMPLETED');
    print('========================================\n');
  } catch (e) {
    print('❌ Google Logout Error: $e');
    Get.snackbar(
      "ERROR",
      "Gagal logout Google: ${e.toString()}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red[100],
      colorText: Colors.black,
    );
  }
}


  
}