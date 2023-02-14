import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_3/Screens/auth/signup_screen.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_bar.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/dashboard.dart';
import 'package:project_3/Screens/splash_screen.dart';
import 'package:project_3/const/app_color.dart';
import 'package:project_3/widgets/custom_button.dart';
import 'package:project_3/widgets/custom_textfield.dart';
import 'package:project_3/widgets/custom_textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isObsecure = true;

  // Future<void> _login() async {
  //   if (_formKey.currentState!.validate()) {
  //     final email = _emailController.text;
  //     final password = _passwordController.text;
  //
  //     // Authenticate the user here
  //     // ...
  //
  //     // Save the user's email and password
  //     final prefs = await SharedPreferences.getInstance();
  //     prefs.setString("email", email);
  //     prefs.setString("password", password);
  //
  //     // Navigate to the dashboard
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar(),));
  //
  //   }
  // }

  Future<void> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("email");
    final password = prefs.getString("password");

    // if(isLoggedIn!=null){
    //   if(isLoggedIn){
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar(),));
    //   }else{
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
    //   }
    // }else{
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
    // }


    if(email != null && password != null){

      if(email == _emailController.text && password == _passwordController.text){
        prefs.setBool(SplashScreenState.KEYLOGIN, true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar(),));
    Get.snackbar(
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.deepPurpleAccent,
            "Login", "Login Successfully");
      }

      }
    else{setState(() {
      prefs.setBool(SplashScreenState.KEYLOGIN, false);
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.deepPurpleAccent,
          "Check", "You first time in the app then Signup otherwise you login");
    });
    }



  //   if (email != null && password != null) {
  //     // Navigate to the dashboard
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar(),));
  //     Get.snackbar(
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.deepPurpleAccent,
  //         "Login", "Login Successfully");
  //   }else{
  //     Get.snackbar(
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.deepPurpleAccent,
  //         "Signup", "Signup first then login");
  // }
    }


  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit an App?'),
        actions:[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
            ),
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
            ),
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            child:Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        //backgroundColor: AppColor.kbgcolor,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topLeft,
                image: AssetImage(
                  "assets/bg.png",
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.only(top: 240.h),
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  height: ScreenUtil().screenHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r)),
                    color: Colors.white,
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Divider(
                        color: Colors.black54,
                        thickness: 5.h,
                        indent: 150.w,
                        endIndent: 150.w,
                      ),
                      Center(
                          child: Text(
                            "Sign In",
                            style: myStyle(35.sp, AppColor.kbgcolor, FontWeight.bold),
                          )),
                      SizedBox(
                        height: 30.h,
                      ),

                      Text(
                        "Welcome Back",
                        style: myStyle(30.sp, AppColor.kbgcolor, FontWeight.bold),
                      ),
                      Text(
                        "Glad to see you back my buddy",
                        style: myStyle(16.sp, Colors.black54, FontWeight.w400),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                        Controller: _emailController,
                        keyBoardType: TextInputType.emailAddress,
                        icon: Icons.email_outlined,
                        labelText: "Email",

                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid password!';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: isObsecure,
                        obscuringCharacter: "•",
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3.w,
                              color: AppColor.kbgcolor,
                            ),
                            borderRadius: BorderRadius.circular(50.0.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3.w,
                              color: AppColor.kbgcolor,
                            ),
                            borderRadius: BorderRadius.circular(50.0.r),
                          ),

                          labelText: "Password",
                          labelStyle: myStyle(20.sp, AppColor.kbgcolor, FontWeight.bold),
                          prefixIcon: Icon(
                            Icons.lock_outlined,
                            color: AppColor.kbgcolor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                            icon: Icon(
                              isObsecure == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColor.kbgcolor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),


                      customButton("Sign In", (){
                        _checkLogin();
                      }),

                      SizedBox(
                        height: 15.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            onPressed: () {
                              //_checkLogin();
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen(),));

                            },
                            child: Text(
                              "Sign Up",
                              style: myStyle(
                                  20.sp,
                                  AppColor.kbgcolor,
                                  FontWeight.w700),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

