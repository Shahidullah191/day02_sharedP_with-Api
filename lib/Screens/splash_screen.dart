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
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("email");
    final password = prefs.getString("password");

    if (email != null && password != null) {
      // Navigate to the dashboard
      LoginScreen.isLoggedIn = true;
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar(),));
    }

  }

  @override
  void initState() {
    Timer(Duration(seconds: 5), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen())));
    super.initState();
    _checkLogin();
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
