import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:project_3/Screens/auth/login_screen.dart';
import 'package:project_3/widgets/custom_textstyle.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 5), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen())));
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
