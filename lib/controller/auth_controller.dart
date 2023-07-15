import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f15_bootcamp_project/controller/feed_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var index = 0.obs;
  var dataList = [].obs;
  var selectedCity = 'Hangi Şehirde Okuyorsun ?'.obs;
  var selectedUniversity = 'Hangi Üniversitedesin ?'.obs;

  var cityUniversites = [].obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FeedController feedController = Get.put(FeedController());

  var selectedImagePath = ''.obs;
  late var pickedFile;
  var profilePicLink = ''.obs;
  var getDownloadURL = ' '.obs;
  var registerName = ''.obs;
  var registerSurname = ''.obs;
  var registerEmail = ''.obs;
  var loginEmail = ''.obs;
  var loginPassword = ''.obs;
  var sifre = ''.obs;

  var phoneNumber = ''.obs;
  Future<User?> createPerson(
    String email,
    String password,
    String name,
    String surname,
    String number,
    String address,
    String university,
  ) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore.collection("user").doc(user.user!.uid).set({
      'name': name,
      'surname': surname,
      'university': university,
      'city': address,
      'password': password,
      'email': email,
      'phoneNumber': '+90' + number,
      'uid': user.user?.uid,
      'profilePhoto': getDownloadURL.value,
    });
    await _firestore
        .collection("sehirler")
        .doc(selectedCity.value)
        .collection(user.user!.uid)
        .doc(user.user!.uid)
        .set({
      'name': name,
      'surname': surname,
      'city': address,
      'password': password,
      'email': email,
      'phoneNumber': '+90' + number,
      'uid': user.user?.uid,
    });

    return user.user;
  }

  Future uploadFile() async {
    log('uploadfile çalıstı');
    final path = 'files/${pickedFile.name}';
    final file = File(pickedFile.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    final snapshot = await ref.putFile(file).whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    getDownloadURL.value = urlDownload;
    log(getDownloadURL.value);
  }

  Future<User?> signIn(
    String email,
    String password,
  ) async {
    var user = await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
      var errorCode = error;
      Get.snackbar('Error', 'Wrong username or password',
          icon: Icon(Icons.close));
    });
    var currentUserUid = user.user!.uid;
    await feedController.fetchDataFromFirebase();

    return user.user;
  }

  void getImage(ImageSource imageSource) async {
    pickedFile = await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      uploadFile();

      print("image_path save");
    } else {
      Get.snackbar("Hata !", "Lütfen Fotoğraf Seçiniz",
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.black);
    }
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/serong/9b25594a7b9d85d3c7f7/raw/9904724fdf669ad68c07ab79af84d3a881ff8859/iller.json'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      dataList.value = data.values.toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<dynamic>> fetchUniversities(String city) async {
    log(city + ' asdasd a');
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/anilozmen/TR-iller-universiteler-JSON/master/province-universities.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final cityData = data.firstWhere((item) => item['province'] == city);
      final universities =
          (cityData['universities'] as List<dynamic>).cast<dynamic>();
      log('asdasdasdasdas');
      cityUniversites.value = universities.toList();
      inspect(cityUniversites.value);
      return universities;
    } else {
      throw Exception('Failed to fetch universities');
    }
  }
}
