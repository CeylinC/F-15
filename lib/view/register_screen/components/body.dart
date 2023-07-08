import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/first_screen/roundedbutton.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/already_have_an_account_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/rounded_input_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/rounded_password_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/login_page.dart';
import 'package:f15_bootcamp_project/view/register_screen/components/background.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {

  final Widget child;
  const Body({super.key, 
  required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("KAYIT OL", 
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height*0.03),
            RoundedinputField(hintText: "İsim",
            icon: Icons.person, 
            onChanged: (value) {}),
            RoundedinputField(hintText: "Soyisim",
            icon: Icons.person, 
            onChanged: (value) {}),
            RoundedinputField(hintText: "E Posta",
            icon: Icons.mail, 
            onChanged: (value) {}),
            RoundedinputField(hintText: "Okul - Şehir",
            icon: Icons.school,
            onChanged: (value) {}),
            RoundedinputField(hintText: "Doğum Tarihi",
            icon: Icons.date_range,
            onChanged: (value) {}),
            RoundedPasswordField(
            onChanged: (value) {}),
            RoundedButton(text: 
            "Kayıt ol", press: () {}, 
            color: k2purplethemeclr, 
            textColor: Colors.white),
            SizedBox(height: size.height*0.02),          
            AlreadyhaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){
                      return loginPage();},
              ),
              );
              },
              )
          ],
        ),
      ),
   );
  }
}
