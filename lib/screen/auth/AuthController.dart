import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_transisi/screen/home/HomeScreen.dart';
import 'package:test_transisi/services/AuthServices.dart';

class AuthController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  onInit() {
    super.onInit();
    print('Auth Controller Loaded');
  }

  void login() async {
    var res =
        await AuthServices.login(email: email.text, password: password.text);
    if (res != null) {
      Get.off(HomeScreen());
    } else {
      Get.snackbar("Failed", "Username atau Password Salah",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    // print("${email.text} ${password.text}");
  }
}
