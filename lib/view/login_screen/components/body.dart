import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/first_screen/roundedbutton.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/Background.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/already_have_an_account_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/rounded_input_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/rounded_password_file.dart';
import 'package:f15_bootcamp_project/view/register_screen/register.dart';
import 'package:flutter/material.dart';
class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return backGround
    (child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("GİRİŞ YAP",
           style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height*0.03,),
          Image.asset("assets/home_button.png",
          height: size.height*0.25,
          ),
          SizedBox(height: size.height*0.03,),
          RoundedinputField(hintText: "E Posta",
          icon: Icons.mail,
           onChanged: (value) {  },  
          ),
          RoundedPasswordField(
            onChanged: (value) {},
            ),
            RoundedButton(text: "Giriş Yap", 
            press: (){},
            color: k2purplethemeclr, 
            textColor: Colors.white),
            SizedBox(height: size.height*0.03,),
            AlreadyhaveAnAccountCheck(press: () {
              Navigator.push
              (context,
              MaterialPageRoute(
              builder: (context) {
              return SignUpScreen();
            },
            ),
            );
              
            },
            ),
          ],
      ),
    ),
    );
  }
}


