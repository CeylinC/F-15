import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/material.dart';

class IlanCard extends StatelessWidget {
  String creatorUid;
  String photoUrl;
  String location;
  String ilanBaslik;
  String star;
  String creatorProfilePhoto;
  IlanCard(
      {super.key,
      required this.ilanBaslik,
      required this.creatorProfilePhoto,
      required this.creatorUid,
      required this.location,
      required this.photoUrl,
      required this.star});
  static double cardWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.network(photoUrl, fit: BoxFit.cover),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 8),
              child: SizedBox(
                width: cardWidth - 20,
                child: Text(
                  ilanBaslik,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: kPurpleColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(location),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(star),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
