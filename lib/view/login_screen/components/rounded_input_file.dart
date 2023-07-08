import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/text_field_container.dart';
import 'package:flutter/material.dart';
class RoundedinputField extends StatelessWidget {
  final String hintText;
  final IconData icon ;
  final ValueChanged <String> onChanged;
  const RoundedinputField({
    Key? key, required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon,
          color: k2purplethemeclr),
          hintText: hintText,
          border: InputBorder.none),
      ),);
  }
}
