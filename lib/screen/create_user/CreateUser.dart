import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_transisi/screen/create_user/CreateUserController.dart';
import 'package:test_transisi/ui/SizeConfig.dart';

// ignore: must_be_immutable
class CreateUser extends StatelessWidget {
  CreateUser({Key key}) : super(key: key);
  CreateUserController controller = Get.put(CreateUserController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text("back", style: TextStyle(color: Colors.green)),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Create User",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: controller.name,
                decoration: InputDecoration(hintText: "Name")),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: controller.job,
                decoration: InputDecoration(hintText: "Job")),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                controller.createUser();
              },
              child: Text(
                "Create User",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
