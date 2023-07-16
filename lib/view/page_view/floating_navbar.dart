import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/navbar_controller.dart';
import '../../core/constants/colors.dart';

class FloatingNavigationBar extends StatelessWidget {
  NavBarController _navBarController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DotNavigationBar(
        enablePaddingAnimation: false,
        margin: EdgeInsets.only(left: 10, right: 10),
        currentIndex: _navBarController.currentIndex.value,
        backgroundColor: Colors.white,
        dotIndicatorColor: Colors.black54,
        unselectedItemColor: Colors.black26,
        // enableFloatingNavBar: false,
        onTap: (int currentIndex) {
          _navBarController.currentIndex.value = currentIndex;
          _navBarController.myPage.jumpToPage(currentIndex);
        },
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.black87,
          ),
          DotNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.solidMessage,
              size: 18,
            ),
            selectedColor: Colors.black87,
          ),
          DotNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            selectedColor: Colors.black87,
          ),

          DotNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.gear,
              size: 20,
            ),
            selectedColor: Colors.black87,
          ),
        ],
      ),
    );
  }
}
