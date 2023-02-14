
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/dashboard.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/logout.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/profile.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/setting.dart';
import 'package:project_3/const/app_color.dart';
import 'package:project_3/widgets/custom_textstyle.dart';

import 'bottom_nav_pages/image.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

 class BottomNavBarState extends State<BottomNavBar> {

    @override
    void initState() {
      super.initState();

      //foreground state.......
      FirebaseMessaging.instance.getInitialMessage();
      FirebaseMessaging.onMessage.listen((message) {
        if(message.notification !=null){
          print(message.notification!.title);
          print(message.notification!.body);
          Navigator.pushNamed(context, message.data['path']);
        }
      });

      //app is opened but not terminated.......
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        if(message.notification !=null){
          print(message.notification!.title);
          print(message.notification!.body);
          print(message.data['path']);
          Navigator.pushNamed(context, message.data['path']);
        }
      });

      //when the app is terminated
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if(message !=null){
          print(message.notification!.title);
          print(message.notification!.body);
          print(message.data['path']);
          Navigator.pushNamed(context, message.data['path']);
        }
      });


    }




  final pages = [DashboardPage(), ProfilePage(), SettingPage(), ImagePage(), LogoutPage(),];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.withOpacity(0.2),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: myStyle(16.sp, Colors.white),
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            label: "DashBoard",
            icon: Icon(Icons.dashboard),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
            backgroundColor: Colors.purple,

          ),
          BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(Icons.settings),
            backgroundColor: Colors.purple,
          ),

          BottomNavigationBarItem(
            label: "Image",
            icon: Icon(Icons.image),
            backgroundColor: Colors.purple,
          ),

          BottomNavigationBarItem(
            label: "Logout",
            icon: Icon(Icons.logout),
            backgroundColor: Colors.purple,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      body: pages[_currentIndex],
    );
  }
}
