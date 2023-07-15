import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
CollectionReference usersCollection = _firestore.collection('user');
DocumentReference userDoc = usersCollection.doc(_auth.currentUser?.uid);

class FeedController extends GetxController {
  var currentUserCity = ''.obs;
  var currentUserName = ''.obs;
  var currentUserProfilePhoto = ''.obs;
  var currentUserPhoneNumber = ''.obs;
  var currentUserUid = _auth.currentUser!.uid.obs;
  var attendeeCount = 0.obs;
  var ilanKacKisi = 0.obs;

  var isEmpty = true.obs;
  var katilanKisiler = [].obs;
  var colorList = [].obs;
  var eventCreatorUid = ''.obs;
  List<Map<String, dynamic>> veriListesi = [];

  Future<void> getAttendeeData() async {
    CollectionReference collectionRef = FirebaseFirestore.instance
        .collection('ilanlar')
        .doc(currentUserCity.value)
        .collection('TÜM İLANLAR')
        .doc(eventCreatorUid.value)
        .collection('Katılımcılar');
    QuerySnapshot snapshot = await collectionRef.get();
    List<QueryDocumentSnapshot> documents = snapshot.docs;
    int docCount = documents.length;
    attendeeCount.value = docCount;
    print('Doküman sayısı: $docCount');

    print('VERİ sayısı: ${attendeeCount.value}');
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

  Stream<QuerySnapshot> getSportPost() {
    var ref = _firestore
        .collection("ilanlar")
        .doc(currentUserCity.value)
        .collection('TÜM İLANLAR')
        .orderBy('date', descending: true)
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
      'uid': currentUserUid.value,
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

  Future createSportPost(
    String place,
    String baslik,
    String sport,
    String profilePhoto,
    bool top,
    int kacKisi,
    String time,
    String date,
  ) async {
    await _firestore
        .collection("ilanlar")
        .doc(currentUserCity.value)
        .collection('TÜM İLANLAR')
        .doc(_auth.currentUser!.uid)
        .set({
      'baslik': baslik,
      'place': place,
      'sport': sport,
      'profilePhoto': profilePhoto,
      'topVarMi': top,
      'kacKisi': kacKisi,
      'time': time,
      'date': date,
      'createdAt': DateTime.now(),
      'uid': _auth.currentUser!.uid,
      'creatorName': currentUserName,
    });
    await _firestore
        .collection("user")
        .doc(_auth.currentUser?.uid)
        .collection('ETKINLIKLER')
        .doc(_auth.currentUser?.uid)
        .collection('OLUSTURDUGU ETKINLIKLER')
        .doc(baslik)
        .set({
      'creatorProfilePhoto': profilePhoto,
      'etkinlikAdi': place,
      'nerede': baslik,
      'date': date,
      'time': time,
      'uid': _auth.currentUser!.uid,
      'createdAt': DateTime.now(),
    });
  }
}
