import 'dart:developer';
import 'package:animated_fab_button_menu/animated_fab_button_menu.dart';
import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/create_ad_screen/ilan_screen.dart';
import 'package:f15_bootcamp_project/view/deneme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../controller/feed_controller.dart';
import '../../controller/navbar_controller.dart';
import '../login_screen/components/custom_text_field.dart';
import '../main_screen/components/text_manager.dart';
import '../main_screen/main_screen.dart';
import '../messaging_page/messaging_page.dart';
import 'floating_navbar.dart';

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TimeOfDay? pickedTime = TimeOfDay.now();
  final NavBarController _barController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _barController.myPage,
        children: <Widget>[
          MainScreen(),
          MessagingPage(),
          IlanVer(),
<<<<<<< Updated upstream
          MapSample(),
          MessagingPage(),
=======
          NotificationPage(),
>>>>>>> Stashed changes
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FloatingNavigationBar(),
      ),
    );
  }

  TextStyle menuStyle() {
    return const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.bold);
  }
}
