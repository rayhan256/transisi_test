import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_transisi/screen/home/HomeScreen.dart';
import 'package:test_transisi/services/FetchData.dart';

class CreateUserController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  void createUser() async {
    var res = await FetchData.createUser(job: job.text, name: name.text);
    if (res != null) {
      Get.off(() => HomeScreen());
    } else {
      Get.snackbar("failed", "Field cannot be empty",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
