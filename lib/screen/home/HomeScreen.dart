import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_transisi/screen/create_user/CreateUser.dart';
import 'package:test_transisi/screen/details/DetailScreen.dart';
import 'package:test_transisi/screen/home/HomeController.dart';
import 'package:test_transisi/ui/SizeConfig.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "List Users",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.white,
            )
          ],
        ),
        body: GetBuilder<HomeController>(
          initState: (_) => controller.getListUser(),
          builder: (val) {
            return val.isLoading
                ? Center(child: CircularProgressIndicator())
                : Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight,
                    child: ListView(
                      children: [
                        for (var data in val.user)
                          UserWidget(
                            avatar: data.avatar,
                            email: data.email,
                            fname: data.firstName,
                            lname: data.lastName,
                            id: data.id,
                          )
                      ],
                    ),
                  );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => CreateUser());
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
        ));
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget(
      {Key key, this.email, this.fname, this.lname, this.avatar, this.id})
      : super(key: key);
  final String email;
  final String fname;
  final String lname;
  final String avatar;
  final int id;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailScreen(
                id: id,
              ));
        },
        child: Row(
          children: [
            Hero(
              tag: "avatar-$id",
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatar),
              ),
            ),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$fname $lname",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text(email,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ],
            ),
            Spacer(),
            Icon(
              Icons.star,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
