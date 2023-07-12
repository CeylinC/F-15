import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/first_screen/first_screen.dart';
import 'package:f15_bootcamp_project/view/first_screen/roundedbutton.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/already_have_an_account_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/rounded_input_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/rounded_password_file.dart';
import 'package:f15_bootcamp_project/view/login_screen/login_page.dart';
import 'package:f15_bootcamp_project/view/register_screen/components/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../denemee_ekranı.dart';


class Body extends StatefulWidget {

  final Widget child;
  const Body({super.key, 
  required this.child});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _emailTextcontroller = TextEditingController();
  TextEditingController _passwordTextcontroller = TextEditingController();
  TextEditingController _school_cityTextcontroller = TextEditingController();
  TextEditingController _dateTextcontroller = TextEditingController();
  TextEditingController _nameTextcontroller = TextEditingController();
  TextEditingController _lastnameTextcontroller = TextEditingController();
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
            onChanged: (value) {}, controller: _nameTextcontroller,),
            RoundedinputField(hintText: "Soyisim",
            icon: Icons.person, 
            onChanged: (value) {}, controller: _lastnameTextcontroller,),
            RoundedinputField(hintText: "E Posta",
            icon: Icons.mail, 
            onChanged: (value) {}, controller: _emailTextcontroller,),
            RoundedinputField(hintText: "Okul - Şehir",
            icon: Icons.school,
            onChanged: (value) {}, controller: _school_cityTextcontroller,),
            RoundedinputField(hintText: "Doğum Tarihi",
            icon: Icons.date_range,
            onChanged: (value) {}, controller: _dateTextcontroller,),
            RoundedPasswordField(
            onChanged: (value) {}, controller: _passwordTextcontroller,),
            RoundedButton(
            text: "Kayıt ol", 
            press: () {FirebaseAuth.instance.createUserWithEmailAndPassword
            (email: _emailTextcontroller.text, 
            password: _passwordTextcontroller.text).then((value) => 
            Navigator.push(
              context, MaterialPageRoute(
                    builder: (context){
                      return denemeekrani();},
              ),),).onError((error, stackTrace) => print("error ${error.toString()}"),
              );
              FirebaseFirestore.instance.collection("person").doc().set({
                "name": _nameTextcontroller.text,
                "lastname" : _lastnameTextcontroller.text,
                "mail": _emailTextcontroller.text,
                "school-city": _school_cityTextcontroller.text,
                "date": _dateTextcontroller.text,

              }).then((value) => Navigator.push(
              context, MaterialPageRoute(
                    builder: (context){
                      return denemeekrani();},
              ),),);
              },
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
