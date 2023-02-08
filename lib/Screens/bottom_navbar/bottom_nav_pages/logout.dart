import 'package:flutter/material.dart';
import 'package:project_3/Screens/auth/login_screen.dart';
import 'package:project_3/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {


  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('email');
    // await prefs.remove('password');
    LoginScreen.isLoggedIn = false;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: customButton("Logout", (){
          logout();
        }),

      ),
    );
  }
}
