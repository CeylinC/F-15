import 'dart:developer';
import 'package:animated_fab_button_menu/animated_fab_button_menu.dart';
import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
  List<String> list = <String>[
    'SIRT',
    'GÖĞÜS',
    'BACAK',
    'İTİŞ',
    'ÇEKİŞ',
    'KARIŞIK',
    'FARK ETMEZ,SADECE BAS!',
  ];
  TimeOfDay? pickedTime = TimeOfDay.now();
  DateTime? _selectedDate = DateTime.now();
  final FeedController _feedController = Get.put(FeedController());
  final NavBarController _barController = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: myFab(context),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _barController.myPage,
        children: <Widget>[
          MainScreen(),
          MainScreen(),
          MainScreen(),
          MessagingPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FloatingNavigationBar(),
      ),
    );
  }

  Column myFab(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: FabMenu(
              fabBackgroundColor: kDarkColor,
              elevation: 2.0,
              fabAlignment: Alignment.bottomCenter,
              fabIcon: const FaIcon(
                FontAwesomeIcons.peopleGroup,
                color: Colors.white,
                size: 19,
              ),
              closeMenuButton: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              overlayOpacity: 0.5,
              overlayColor: kDarkColor,
              children: [
                MenuItem(
                  title: 'Ev ilanı oluştur',
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                              color: kBackgroundColor,
                              border: Border.all(color: kDarkColor),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              )),
                          height: Get.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextManager(text: 'İlan Başlığı'),
                              CustomTextField(
                                onChanged: (input) {
                                  _barController.sportBaslik.value = input;
                                },
                                textInputType: TextInputType.emailAddress,
                                isHidden: false,
                                hintText: 'Çekici bir başlık yaz',
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextManager(text: 'Nerede ?'),
                              ),
                              CustomTextField(
                                onChanged: (input) {
                                  _barController.sportNerede.value = input;
                                },
                                textInputType: TextInputType.emailAddress,
                                isHidden: false,
                                hintText: 'Bilgileri doğru girdiğine emin ol !',
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextManager(text: 'Hangi Spor ?'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextManager(text: 'Top Var mı ?'),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  style: menuStyle(),
                ),
              ]),
        ),
        SizedBox(
          height: Get.height / 14,
        )
      ],
    );
  }

  Future<dynamic> fitnessCreatePost(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: false,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: kBackgroundColor,
              border: Border.all(color: kDarkColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              )),
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              FloatingActionButton(
                mini: true,
                backgroundColor: Colors.green,
                child: FaIcon(
                  FontAwesomeIcons.check,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _barController.selectedDateFitness.value = '';
                  _barController.selectedTimeFitness.value = '';
                },
                heroTag: '1',
              ),
            ],
          ),
        );
      },
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
