import 'package:get/get.dart';
import 'package:test_transisi/services/FetchData.dart';

class HomeController extends GetxController {
  List user;
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
  }

  void getListUser() async {
    isLoading = true;
    var res = await FetchData.getListUsers();
    user = res.data;
    isLoading = false;
    update();
  }
}
