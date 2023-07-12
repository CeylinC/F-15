import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/first_screen/roundedbutton.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/Background.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/already_have_an_account_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/rounded_input_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/rounded_password_file.dart';
import 'package:f15_bootcamp_project/view/register_screen/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../denemee_ekranı.dart';
class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
TextEditingController _emailTextcontroller = TextEditingController();
TextEditingController _passwordTextcontroller = TextEditingController();
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
          icon: Icons.mail, controller: _emailTextcontroller,
           onChanged: (value) {  },   
          ),
          RoundedPasswordField(
            onChanged: (value) {}, controller: _passwordTextcontroller,
            ),
            RoundedButton(text: "Giriş Yap", 
            press: (){ FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailTextcontroller.text, 
            password: _passwordTextcontroller.text).then((value) {
              Navigator.push(
              context, MaterialPageRoute(
                    builder: (context){
                      return denemeekrani();},
              ),
              );
            }).onError((error, stackTrace) { print("error ${error.toString()}");}
              );},
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


