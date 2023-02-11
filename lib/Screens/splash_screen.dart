import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:project_3/Screens/auth/login_screen.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_bar.dart';
import 'package:project_3/widgets/custom_textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static const String KEYLOGIN = "login";

  Future<void> whereToGo() async {
    final prefs = await SharedPreferences.getInstance();

    var isLoggedIn =  await prefs.getBool(KEYLOGIN);

    // final email = prefs.getString("email");
    // final password = prefs.getString("password");

    Timer(Duration(seconds: 5), () async {
      if(isLoggedIn!=null){
        if(await isLoggedIn){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar(),));
        }else{
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
        }
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
      }
    });


    // if (email != null && password != null) {
    //   // Navigate to the dashboard
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar(),));
    // }

  }

  @override
  void initState() {
    whereToGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/ecommerce.json"),

          Text("Welcome to My",
            style: myStyle(40.sp, Colors.purple, FontWeight.w700),),
          Text("E-commerce",
            style: myStyle(40.sp, Colors.purpleAccent, FontWeight.bold),),

        ],
      ),
    );
  }
}
