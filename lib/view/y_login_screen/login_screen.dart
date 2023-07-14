import 'package:f15_bootcamp_project/controller/auth_controller.dart';
import 'package:f15_bootcamp_project/view/messaging_page/conversation_screen.dart';
import 'package:f15_bootcamp_project/view/y_register_screen/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import 'components/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            Image.asset(
              'assets/yellow_line.png',
              scale: 2,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/red_line.png', scale: 2),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'spot',
                        style: TextStyle(
                          color: kDarkColor,
                          fontFamily: 'Stabillo',
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    onChanged: (input) {
                      authController.loginEmail.value = input;
                    },
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Mail Adresi',
                    isHidden: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    onChanged: (input) {
                      authController.loginPassword.value = input;
                    },
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Şifre',
                    isHidden: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyCustomButton(
                  onTap: () async {
                    authController
                        .signIn(authController.loginEmail.value,
                            authController.loginPassword.value)
                        .whenComplete(() {
                      Get.off(ConversationPage());
                    });
                  },
                  text: 'Giriş Yap',
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Divider(
                    color: kAppThemeClr.withOpacity(0.5),
                    thickness: 1,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Hesabın yok mu?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Poppins'),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Kayıt ol',
                            style: TextStyle(
                                color: kBlueThemeClr,
                                fontFamily: 'Poppins',
                                fontSize: 13),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(
                                  RegisterPage(),
                                );
                                // navigate to desired screen
                              })
                      ]),
                ),
              ],
            )
          ],
        ));
  }
}

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
            color: kBlackThemeClr,
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
