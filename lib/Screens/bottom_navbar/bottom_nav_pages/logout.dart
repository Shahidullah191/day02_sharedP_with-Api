import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3/Screens/auth/login_screen.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_bar.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/bottom_navbar_other_spages/image_picker_example.dart';
import 'package:project_3/Screens/splash_screen.dart';
import 'package:project_3/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'bottom_navbar_other_spages/set_photo_screen.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SplashScreenState.KEYLOGIN, false);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async => await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ))),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Logout"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customButton("Logout", () {
                Get.defaultDialog(
                  title: "Logout",
                  titlePadding: EdgeInsets.only(top: 20),
                  contentPadding: EdgeInsets.all(20),
                  middleText: "Are you sure you want to logout the screen",
                  confirm: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        logout();
                        Get.snackbar(
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.deepPurpleAccent,
                            "Logout",
                            "Logout Successfully");
                      },
                      child: Text("Ok")),
                  cancel: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel")),
                );
              }),

              SizedBox(height: 20.h,),
              customButton("Image Picker", (){
                Get.to(SetPhotoScreen());
              })


            ],
          ),
        )
      ),
    );
  }
}
