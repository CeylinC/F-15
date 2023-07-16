import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/main_screen/components/drawer_tile.dart';
import 'package:f15_bootcamp_project/view/main_screen/main_screen.dart';
import 'package:f15_bootcamp_project/view/settings_screen/settings.dart';
import 'package:f15_bootcamp_project/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/feed_controller.dart';

class MyDrawer extends StatelessWidget {
  FeedController feedController = Get.put(FeedController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kDarkColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: kDarkColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: NetworkImage(Uri.parse(
                              feedController.currentUserProfilePhoto.value)
                          .toString()),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    border: Border.all(
                      color: kYellowColor,
                      width: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DrawerTile(
            text: 'Ana Sayfa',
            icon: FontAwesomeIcons.home,
            page: MainScreen(),
          ),
          DrawerTile(
            text: 'Takvim',
            icon: FontAwesomeIcons.calendar,
            page: SplashScreen(), //Ekranı olmadığı için en başa attım
          ),
          DrawerTile(
            text: 'Ayarlar',
            icon: FontAwesomeIcons.gear,
            page: SettingsPage(),
          ),
        ],
      ),
    );
  }
}
