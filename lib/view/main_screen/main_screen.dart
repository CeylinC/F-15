import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f15_bootcamp_project/view/main_screen/components/takvim_card.dart';
import 'package:f15_bootcamp_project/view/main_screen/components/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/feed_controller.dart';
import '../../core/constants/colors.dart';
import 'components/my_drawer.dart';

FeedController feedController = Get.put(FeedController());

class MainScreen extends StatelessWidget {
  final List<Color> colors = [
    kPurpleColor,
    kPurpleColor,
    kPurpleColor,
  ];
  final List<Widget> containers = [
    CarouselCard(
      baslik: 'Uygun Fiyata Güvenli Seyahat.',
      lottie: 'assets/eVKgBT7dw9.json',
    ),
    CarouselCard(
      baslik: 'Öğrenci Dostu.',
      lottie: 'assets/animation_lk41fahk.json',
    ),
    CarouselCard(
      baslik: ' spot\n Uyguna Konakla',
      lottie: 'assets/eVKgBT7dw9.json',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      extendBody: true,
      backgroundColor: kBackgroundColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: Get.width,
              color: kPurpleColor,
              height: 250,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'İyi Günler, ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white54,
                          ),
                        ),
                        Obx(
                          () => Text(
                            feedController.currentUserName.value,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 200,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 200,
                          child: CarouselSlider.builder(
                            slideBuilder: (index) {
                              return containers[index];
                            },
                            slideIndicator: CircularSlideIndicator(
                              currentIndicatorColor: Colors.white,
                              indicatorBackgroundColor: Colors.white54,
                              itemSpacing: 15,
                              indicatorRadius: 3,
                              padding: EdgeInsets.only(bottom: 8),
                              indicatorBorderColor: Colors.white54,
                            ),
                            itemCount: colors.length,
                            initialPage: 0,
                            enableAutoSlider: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextManager(text: 'İlanlara Göz at'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kDarkColor.withOpacity(0.3),
                        borderRadius: customRadius(),
                      ),
                      child: Column(
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextManager(
              text: 'Sıkça Sorulan Sorular',
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }

  BorderRadius customRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(32),
      bottomLeft: Radius.circular(32),
      bottomRight: Radius.circular(8),
    );
  }
}

class CarouselCard extends StatelessWidget {
  String baslik;
  String lottie;
  CarouselCard({super.key, required this.baslik, required this.lottie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        baslik,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Lottie.asset(lottie, width: 150, height: 100),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Detaylı Bilgi',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  FeedController feedController = Get.put(FeedController());
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
            log(feedController.currentUserProfilePhoto.value);

            feedController.fetchDataFromFirebase();
            log(feedController.currentUserProfilePhoto.value);
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset(
                'assets/menu.svg',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'spot',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          )
        ],
      ),
      actions: [
        Obx(() => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundImage: NetworkImage(
                      Uri.parse(feedController.currentUserProfilePhoto.value)
                          .toString()),
                  backgroundColor: Colors.transparent,
                ),
              ),
            )),
      ],
      backgroundColor: kPurpleColor,
    );
  }
}
