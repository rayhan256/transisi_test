import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_transisi/services/FetchData.dart';

class HomeController extends GetxController {
  List user;
  bool isLoading = false;
  TextEditingController search = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getListUser();
  }

  void getListUser() async {
    isLoading = true;
    var res = await FetchData.getListUsers();
    user = res.data;
    isLoading = false;
    update();
  }

  void searchUser() {
    if (search.text.isEmpty) {
      getListUser();
      Get.back();
    } else {
      List filteredUser = user
          .where((val) =>
              val.firstName.toString().toLowerCase() ==
                  search.text.toLowerCase() ||
              val.lastName.toString().toLowerCase() ==
                  search.text.toLowerCase() ||
              val.email.toString().toLowerCase() == search.text.toLowerCase())
          .toList();

      search.text = "";
      user = filteredUser;
      Get.back();
    }
    update();
  }
}
