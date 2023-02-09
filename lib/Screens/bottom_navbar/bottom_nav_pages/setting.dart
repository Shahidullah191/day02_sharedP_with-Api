import 'package:flutter/material.dart';

import '../bottom_nav_bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async => await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const BottomNavBar(),))),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }
}
