import 'dart:developer';
import 'dart:io';

import 'package:f15_bootcamp_project/controller/auth_controller.dart';
import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../y_login_screen/components/custom_text_field.dart';
import '../y_login_screen/login_screen.dart';

class RegisterPage extends StatelessWidget {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: Row(
                    children: [
                      Text(
                        'Kayıt Ol',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 72,
                      backgroundColor: kPurpleColor.withOpacity(0.7),
                      child: authController.selectedImagePath.value != ''
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: FileImage(
                                File(
                                  (authController.selectedImagePath.value),
                                ),
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70,
                              child: Icon(Icons.person)),
                    ),
                    Positioned(
                      top: 100,
                      left: 65,
                      child: RawMaterialButton(
                        elevation: 10,
                        fillColor: kPurpleColor,
                        child: Icon(Icons.add_a_photo, color: Colors.white),
                        padding: EdgeInsets.all(10),
                        shape: CircleBorder(),
                        onPressed: () {
                          showPicker(context);
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Profil Fotoğrafı Seç',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                CustomTextField(
                  onChanged: (input) {
                    authController.registerName.value = input;
                  },
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Adın',
                  isHidden: false,
                ),
                CustomTextField(
                  onChanged: (input) {
                    authController.registerSurname.value = input;
                  },
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Soyadın',
                  isHidden: false,
                ),
                CustomTextField(
                  onChanged: (input) {
                    authController.registerEmail.value = input;
                  },
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email Adresin',
                  isHidden: false,
                ),
                CustomTextField(
                  onChanged: (input) {
                    authController.sifre.value = input;
                  },
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Şifre',
                  isHidden: false,
                ),
                CustomTextField(
                  onChanged: (input) {
                    authController.phoneNumber.value = input;
                  },
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Telefon Numaran(Başında 0 olmadan gir)',
                  isHidden: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Row(
                    children: [
                      Text(
                        'Üniversite',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Obx(
                          () => Text(
                            authController.selectedCity.value,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RichText(
                          text: TextSpan(
                              text: ' tıkla ve seç',
                              style: TextStyle(
                                color: kPurpleColor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  authController.fetchData();
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Scaffold(
                                        backgroundColor: kBackgroundColor,
                                        body: Obx(
                                          () => ListView.builder(
                                            itemCount:
                                                authController.dataList.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                onTap: () {
                                                  authController
                                                          .selectedCity.value =
                                                      authController
                                                          .dataList[index];
                                                  log(authController
                                                      .selectedCity.value);
                                                  authController
                                                      .fetchUniversities(
                                                          authController
                                                              .selectedCity
                                                              .value);
                                                  Navigator.pop(context);
                                                },
                                                leading: Text(
                                                  authController
                                                      .dataList[index],
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  // navigate to desired screen
                                }),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Obx(
                          () => Text(
                            authController.selectedUniversity.value,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RichText(
                          text: TextSpan(
                              text: ' tıkla ve seç',
                              style: TextStyle(
                                color: kPurpleColor,
                                fontFamily: 'Poppins',
                                fontSize: 14,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Scaffold(
                                        backgroundColor: kBackgroundColor,
                                        body: Obx(
                                          () => ListView.builder(
                                            itemCount: authController
                                                .cityUniversites.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                onTap: () {
                                                  authController
                                                      .selectedUniversity
                                                      .value = authController
                                                          .cityUniversites[
                                                      index]["name"];
                                                  Navigator.pop(context);
                                                },
                                                leading: Text(
                                                  authController
                                                          .cityUniversites[
                                                      index]["name"],
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  // navigate to desired screen
                                }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MyCustomButton(
                    onTap: () {
                      authController.createPerson(
                        authController.registerEmail.value,
                        authController.sifre.value,
                        authController.registerName.value,
                        authController.registerSurname.value,
                        authController.phoneNumber.value,
                        authController.selectedCity.value,
                        authController.selectedUniversity.value,
                      );
                      Get.to(LoginScreen());
                    },
                    text: 'Kayıt Ol')
              ],
            ),
          )),
    );
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Galeri'),
                      onTap: () {
                        authController.getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Kamera'),
                    onTap: () {
                      authController.getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.delete),
                    title: new Text('Kaldır'),
                    onTap: () {
                      authController.getDownloadURL.value = '';
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
