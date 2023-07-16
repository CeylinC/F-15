import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCustomButton extends StatelessWidget {
  late String text;
  late Function() onTap;

  MyCustomButton({required this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: Get.width / 2,
          height: 40,
          decoration: BoxDecoration(
            color: kPurpleColor,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
