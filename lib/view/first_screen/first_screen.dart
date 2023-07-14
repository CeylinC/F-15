import 'package:f15_bootcamp_project/view/first_screen/roundedbutton.dart';
import 'package:f15_bootcamp_project/view/y_login_screen/login_screen.dart';
import 'package:f15_bootcamp_project/view/y_register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../denemee_ekranı.dart';
import '../login_screen/login_page.dart';
import '../register_screen/register.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "spot uygulamasına hoş geldiniz",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Text(
            'spot',
            style: TextStyle(
              color: kDarkColor,
              fontFamily: 'Stabillo',
              fontSize: 100,
            ),
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),
          RoundedButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            text: 'GİRİŞ YAP',
            color: kPurpleColor,
            textColor: Colors.white,
          ),
          RoundedButton(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterPage();
                  },
                ),
              );
            },
            color: klightpurplethemeclr.withOpacity(0.5),
            text: 'KAYIT OL',
            textColor: Colors.black,
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return denemeekrani();
                      },
                    ),
                  );
                },
                child: Text(
                  "Kayıt Olmadan Devam Et",
                  style: TextStyle(
                    color: Colors.black45,
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
