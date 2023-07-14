import 'package:f15_bootcamp_project/view/profile_page/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:f15_bootcamp_project/view/settings_screen/settings.dart';
import 'package:f15_bootcamp_project/view/settings_screen/UpdateAccount.dart';
import 'package:f15_bootcamp_project/view/settings_screen/NotificationPref.dart';
import 'package:f15_bootcamp_project/view/settings_screen/Preferences.dart';
import 'package:f15_bootcamp_project/view/login_screen/login_page.dart';
import 'package:f15_bootcamp_project/view/faq_screen/faq.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      title: 'spot',
      routes: {
        "/": (context) => ProfileScreen(), //anasayfa hazır olunca oraya yönlendiririz
        "/Settings": (context) => Settings(),
        "/FAQ": (context) => FAQ(),
        "/SignOut": (context) => LoginPage(), //sign in sayfasına yönlendir
        "/UpdateAccount": (context) => UpdateAccount(),
        "/NotificationPref": (context) => NotificationPref(),
        "/Preferences": (context) => Preferences(),
      },
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: ProfileScreen(),
    );
  }
}
