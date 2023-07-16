import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  late String hintText;
  late bool isHidden;
  TextInputType textInputType;
  Function(String input) onChanged;
  CustomTextField(
      {required this.hintText,
      required this.isHidden,
      required this.onChanged,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: kPurpleColor)),
        child: Form(
          key: formKey,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Bu alan boş bırakılamaz';
              }
              // Doğrulama işlemleri

              return null; // Doğrulama başarılı, hata yok
            },
            onChanged: onChanged,
            keyboardType: textInputType,
            obscureText: isHidden,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: Colors.black45,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
