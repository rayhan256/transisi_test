import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_transisi/screen/details/DetailController.dart';
import 'package:test_transisi/ui/SizeConfig.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key key, this.id}) : super(key: key);
  DetailController controller = Get.put(DetailController());
  int id;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Icon(Icons.star, color: Colors.white),
          Icon(
            Icons.edit,
            color: Colors.white,
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GetBuilder<DetailController>(
        initState: (_) => controller.getDetail(id: id),
        builder: (val) {
          return val.isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    children: [
                      Hero(
                        tag: "avatar-$id",
                        child: Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.screenHeight * .5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(val.user.avatar),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(.8),
                                  BlendMode.color),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment(-.0, .75),
                            child: Text(
                              "${val.user.firstName} ${val.user.lastName}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      UserDetailWidget(
                        email: val.user.email,
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class UserDetailWidget extends StatelessWidget {
  const UserDetailWidget({Key key, this.email}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        )
      ]),
      child: Row(
        children: [
          Icon(Icons.email, color: Colors.green),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$email",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Email",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
