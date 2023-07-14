import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/first_screen/first_screen.dart';
import 'package:f15_bootcamp_project/view/splash_screen.dart';
import 'package:flutter/material.dart';

class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Image.asset(
              "assets/onboarding-vector-3.png",
            ),
          ),
          const Text(
            "Deneyimlerinle Değerlendir",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return WelcomePage();
                  },
                  fullscreenDialog: true,
                  settings: const RouteSettings()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: const Text(
              "Başla",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
