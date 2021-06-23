import 'package:get/get.dart';
import 'package:test_transisi/services/FetchData.dart';

class DetailController extends GetxController {
  var user;
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
  }

  void getDetail({int id}) async {
    isLoading = true;
    var res = await FetchData.getUserDetail(id: id);
    user = res.data;
    isLoading = false;
    update();
  }
}
