import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:f15_bootcamp_project/view/first_screen/components/background.dart';
import 'package:f15_bootcamp_project/view/first_screen/roundedbutton.dart';
import 'package:flutter/material.dart';

import '../../denemee_ekranı.dart';
import '../../login_screen/login_page.dart';
import '../../register_screen/register.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Background(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(
          "spot uygulamasına hoş geldiniz",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height*0.05,),
          Image.asset("assets/spot.png",
          width: size.width*0.5,
          ),
           SizedBox(height: size.height*0.06,),
          RoundedButton(
            press: () {
              Navigator.push(
               context,
                MaterialPageRoute(
                 builder: (context){
                   return loginPage();
                   },
            ),
            );
            },
            text: 'GİRİŞ YAP', color: k2purplethemeclr,
            textColor: Colors.white,
          ),
          RoundedButton(
            press: () {  Navigator.push
            (context,
            MaterialPageRoute(
            builder: (context) {
            return SignUpScreen();
             },
            ),
           );
          }, 
            color: klightpurplethemeclr,
            text: 'KAYIT OL',
            textColor: Colors.black,
          ),
          SizedBox(height: size.height*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Misafir olarak ",style: TextStyle(color: k2purplethemeclr
            ),
            ),
            GestureDetector(
              onTap: () {Navigator.push(
              context, MaterialPageRoute(
                    builder: (context){
                      return denemeekrani();},
              ),
              );},
              child: Text("Devam Et",style: TextStyle(color: k2purplethemeclr,
              fontWeight: FontWeight.bold,)
              ,),
            ),
            ],
            )
        ],
          ),
      ),
   );
  }
}

