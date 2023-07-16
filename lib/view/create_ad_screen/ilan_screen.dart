import 'dart:developer';
import 'dart:io';

import 'package:f15_bootcamp_project/controller/feed_controller.dart';
import 'package:f15_bootcamp_project/view/login_screen/components/custom_text_field.dart';
import 'package:f15_bootcamp_project/view/login_screen/login_screen.dart';
import 'package:f15_bootcamp_project/view/main_screen/components/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/colors.dart';

class IlanVer extends StatefulWidget {
  @override
  _IlanVerState createState() => _IlanVerState();
}

class _IlanVerState extends State<IlanVer> {
  GoogleMapController? _mapController;
  Marker? _selectedMarker;
  FeedController feedController = Get.put(FeedController());
  @override
  void initState() {
    _determinePosition();
    feedController.lat.refresh();
    feedController.longitude.refresh();
    super.initState();
  }

  @override
  void dispose() {
    _mapController!.dispose();
    super.dispose();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position? position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    feedController.lat.value = position.latitude;
    feedController.longitude.value = position.longitude;

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 300,
              child: GoogleMap(
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: LatLng(feedController.lat.value,
                        feedController.longitude.value),
                    zoom: 17),
                markers: Set<Marker>.of(
                    _selectedMarker != null ? [_selectedMarker!] : []),
                onTap: _onMapTapped,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Evinin Konumunu Haritada İşaretle'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showPicker(context);
                },
                child: Obx(
                  () => Container(
                    width: Get.width / 1.2,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: feedController.selectedImagePath.value != ''
                        ? Container(
                            child: Image(
                                image: FileImage(
                              File(
                                (feedController.selectedImagePath.value),
                              ),
                            )),
                          )
                        : Center(
                            child: Text(
                              'Fotoğraf Seçmek İçin Tıklayınız',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            TextManager(text: 'İlan Başlığı'),
            CustomTextField(
              hintText: 'Çekici bir başlık gir',
              isHidden: false,
              onChanged: (value) {
                feedController.ilanBasligi.value = value;
              },
              textInputType: TextInputType.name,
            ),
            TextManager(text: 'İlan Açıklaması'),
            CustomTextField(
              hintText: 'Örn : Metroya yakın merkezi konumda',
              isHidden: false,
              onChanged: (value) {
                feedController.ilanAciklama.value = value;
              },
              textInputType: TextInputType.name,
            ),
            TextManager(text: 'Semt'),
            CustomTextField(
              hintText: 'Yaşadığın semti yaz (Örn : Çankaya)',
              isHidden: false,
              onChanged: (value) {
                feedController.ilanSemti.value = value;
              },
              textInputType: TextInputType.name,
            ),
            TextManager(text: 'Günlük Ücret'),
            CustomTextField(
              hintText: 'Ücret Gir',
              isHidden: false,
              onChanged: (value) {
                feedController.ilanUcret.value = int.parse(value);
              },
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            MyCustomButton(
                onTap: () {
                  feedController.createAd(
                      feedController.getDownloadURL.value.toString(),
                      feedController.selectedLong.value.toString(),
                      feedController.selectedLat.value.toString(),
                      feedController.ilanBasligi.value,
                      feedController.currentUserProfilePhoto.value,
                      feedController.ilanUcret.value,
                      feedController.ilanAciklama.value,
                      feedController.ilanSemti.value);
                },
                text: 'İlanı Paylaş'),
            SizedBox(
              height: 300,
            ),
          ],
        ),
      ),
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
                        feedController.getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Kamera'),
                    onTap: () {
                      feedController.getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.delete),
                    title: new Text('Kaldır'),
                    onTap: () {
                      feedController.getDownloadURL.value = '';
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onMapTapped(LatLng latLng) {
    setState(() {
      _selectedMarker = Marker(
        markerId: MarkerId('selected_location'),
        position: latLng,
      );
    });
    feedController.selectedLat.value = _selectedMarker!.position.latitude;
    feedController.selectedLong.value = _selectedMarker!.position.longitude;
  }
}
