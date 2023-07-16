import 'package:f15_bootcamp_project/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  const Ad({super.key});
  static double cardWidth = 200;
  static double cardHeight = 250;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: cardWidth,
        height: cardHeight,
        child: Card(
          elevation: 0,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    width: cardWidth,
                    height: 140,
                    child: Image.network(
                        "https://i.pinimg.com/236x/76/cd/fd/76cdfd5c95f05195d323c770af75324d.jpg",
                        fit: BoxFit.cover),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: cardWidth - 20,
                  child: const Text(
                    "İlan Deneme",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: kPurpleColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("İstanbul"),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("5.0"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
