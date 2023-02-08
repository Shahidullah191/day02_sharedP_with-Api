
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/dashboard.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/logout.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/profile.dart';
import 'package:project_3/Screens/bottom_navbar/bottom_nav_pages/setting.dart';
import 'package:project_3/const/app_color.dart';
import 'package:project_3/widgets/custom_textstyle.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final pages = [DashboardPage(), ProfilePage(), SettingPage(), LogoutPage()];
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
