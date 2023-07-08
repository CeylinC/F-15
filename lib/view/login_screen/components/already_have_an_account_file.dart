import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/material.dart';
class AlreadyhaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyhaveAnAccountCheck({
    Key? key, 
    this.login=true, 
    required this.press 
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Hesabınız yok mu ? " : "Hesabınız var mı ? ",
        style: TextStyle(color: k2purplethemeclr ),
        ),
        GestureDetector(
          onTap: press,
          child: 
          Text( 
            login ?  "Kayıt Ol" : "Giriş Yap",
          style: TextStyle(
            color: k2purplethemeclr,
            fontWeight: FontWeight.bold,
          ),),
        )
      ],
    );
  }
}