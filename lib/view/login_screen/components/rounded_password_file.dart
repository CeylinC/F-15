import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/text_field_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged <String> onChanged;
  const RoundedPasswordField({
    Key? key, 
    required this.onChanged, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText:true ,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
        hintText: "Şifre",
        icon: Icon(Icons.lock,
        color: k2purplethemeclr,
        ),
         border: InputBorder.none,
      ),
      ),
      );
  }
}