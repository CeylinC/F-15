import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
CollectionReference usersCollection = _firestore.collection('user');
DocumentReference userDoc = usersCollection.doc(_auth.currentUser?.uid);

class FeedController extends GetxController {
  var currentUserCity = ''.obs;
  var currentUserName = ''.obs;
  var currentUserUniversity = ''.obs;

  var currentUserProfilePhoto = ''.obs;
  var currentUserPhoneNumber = ''.obs;
  var currentUserUid = _auth.currentUser?.uid.obs;
  var lat = 0.0.obs;
  var longitude = 0.0.obs;
  var selectedLat = 0.0.obs;
  var selectedLong = 0.0.obs;
  var ilanBasligi = ''.obs;
  var ilanAciklama = ''.obs;
  var ilanSemti = ''.obs;
  var ilanUcret = 0.obs;
  var selectedImagePath = ''.obs;
  late var pickedFile;
  var getDownloadURL = ''.obs;

  var eventCreatorUid = ''.obs;
  List<Map<String, dynamic>> veriListesi = [];
  Future uploadFile() async {
    log('uploadfile çalıstı');
    final path = 'files/posts/${pickedFile.name}';
    final file = File(pickedFile.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    final snapshot = await ref.putFile(file).whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    getDownloadURL.value = urlDownload;
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

  fetchDataFromFirebase() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(_auth.currentUser?.uid)
        .get();

    if (snapshot.exists) {
      var data = snapshot.data() as Map<String, dynamic>;
      // Verileri "veriListesi" listesine ekleyin
      veriListesi.add(data);
      currentUserName.value = veriListesi[0]['name'];
      currentUserCity.value = veriListesi[0]['city'];
      currentUserPhoneNumber.value = veriListesi[0]['phoneNumber'];
      currentUserProfilePhoto.value = veriListesi[0]['profilePhoto'];
      currentUserUniversity.value = veriListesi[0]['university'];

      inspect(veriListesi);
    }
  }

  Stream<QuerySnapshot> getAttendeeAvatars() {
    var ref = _firestore
        .collection("ilanlar")
        .doc(currentUserCity.value)
        .collection('TÜM İLANLAR')
        .doc(eventCreatorUid.value)
        .collection('Katılımcılar')
        .snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getJoinedEvents(String uid) {
    var ref = _firestore
        .collection("user")
        .doc(uid)
        .collection('ETKINLIKLER')
        .doc(uid)
        .collection('KATILDIGI ETKINLIKLER')
        .snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getCreatedEvents(String uid) {
    var ref = _firestore
        .collection("user")
        .doc(uid)
        .collection('ETKINLIKLER')
        .doc(uid)
        .collection('OLUSTURDUGU ETKINLIKLER')
        .snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getAds() {
    var ref = _firestore
        .collection('ilanlar')
        .doc(currentUserCity.value)
        .collection('TÜM İLANLAR')
        .snapshots();

    return ref;
  }

  Future joinSportPost(
    String creatorUid,
    String name,
    String profilePhoto,
    String number,
    String nerede,
    String neZaman,
    String saat,
    String creatorProfilePhoto,
    String etkinlikAdi,
  ) async {
    await _firestore
        .collection("ilanlar")
        .doc(currentUserCity.value)
        .collection('TÜM İLANLAR')
        .doc(creatorUid)
        .collection('Katılımcılar')
        .doc(_auth.currentUser!.uid)
        .set({
      'ad': name,
      'profilePhoto': profilePhoto,
      'number': number,
      'uid': currentUserUid?.value,
    });
    await _firestore
        .collection("user")
        .doc(_auth.currentUser?.uid)
        .collection('ETKINLIKLER')
        .doc(_auth.currentUser?.uid)
        .collection('KATILDIGI ETKINLIKLER')
        .doc(etkinlikAdi)
        .set({
      'creatorProfilePhoto': creatorProfilePhoto,
      'etkinlikAdi': etkinlikAdi,
      'nerede': nerede,
      'date': neZaman,
      'time': saat,
      'uid': creatorUid,
    });
  }

  Future createAd(
    String photoUrl,
    String long,
    String lat,
    String ilanBaslik,
    String creatorProfilePhoto,
    int para,
    String ilanDetay,
    String ilanSemti,
  ) async {
    await _firestore
        .collection("ilanlar")
        .doc(currentUserCity.value)
        .collection('TÜM İLANLAR')
        .doc(_auth.currentUser!.uid)
        .set({
      'lat': lat,
      'long': long,
      'ilanBaslik': ilanBaslik,
      'creatorProfilePhoto': creatorProfilePhoto.toString(),
      'para': para,
      'ilanDetay': ilanDetay,
      'ilanSemti': ilanSemti,
      'photoUrl': photoUrl,
      'createdAt': DateTime.now(),
      'uid': _auth.currentUser!.uid.toString(),
      'creatorName': currentUserName.value,
    });
    await _firestore
        .collection("user")
        .doc(_auth.currentUser?.uid)
        .collection('ilanları')
        .doc(_auth.currentUser?.uid)
        .collection('Tüm İlanları')
        .doc(ilanBaslik)
        .set({
      'creatorProfilePhoto': creatorProfilePhoto,
      'lat': lat,
      'long': long,
      'uid': _auth.currentUser!.uid,
      'createdAt': DateTime.now(),
    });
  }
}
