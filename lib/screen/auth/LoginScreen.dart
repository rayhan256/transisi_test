import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_transisi/screen/auth/AuthController.dart';
import 'package:test_transisi/ui/SizeConfig.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);
  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.email,
                decoration: InputDecoration(hintText: "Email"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.password,
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                onPressed: () {
                  controller.login();
                },
                color: Colors.green,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
